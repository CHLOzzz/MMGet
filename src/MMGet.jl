module MMGet

using GZip, MatrixMarket, Random

export mmget

function mmget(url::String)

    ## Helper functions
    function clean(dir::String, delDir::Bool, file::String, zipFile::String)
        
        if delDir
            rm(dir, recursive = true)
        else
            rm(file)
            rm(zipFile)
        end # if
        
    end # clean
    
    function nameFile(dir::String, ext::String)
        
        name::String = ""
        
        while true
            name = randstring(20)
            isfile(dir*name*ext) || break
        end # while
        
        return dir*name*ext
        
    end # nameFile
    
    function setupDir(tempDir::String)
        
        if !isdir(tempDir)
            mkdir(tempDir)
            return true
        else
            return false
        end # if
        
    end # setupDir
    
    ## Initialization
    tmpDir::String = pwd()*"/tmp/"
    mtxFilepath::String = nameFile(tmpDir, ".mtx")
    gzipMtxFilepath::String = nameFile(tmpDir, ".gz")
    tmpDel::Bool = setupDir(tmpDir)
    
    ## Save downloaded .mtx.gz to a temp file
    download(url, gzipMtxFilepath)
    
    ## Extract the .mtx data from the .mtx.gz file
    mtxGzStream::GZipStream = GZip.open(gzipMtxFilepath)
    filecontents::Vector{UInt8} = read(mtxGzStream)
    close(mtxGzStream)
    
    ## Write the .mtx data to a file
    open(mtxFilepath, "w") do mtxGzStream
        write(mtxGzStream, filecontents)
    end # open
    
    ## Store the matrix to a variable to return
    A = mmread(mtxFilepath)
    
    ## Cleanup
    clean(tmpDir, tmpDel, mtxFilepath, gzipMtxFilepath)
    
    ## Return
    return A
    
end # mmget

end # module
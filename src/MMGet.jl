module MMGet

using MatrixMarket
using GZip

export mmget

function mmget(url::String)
    mkdir("tmp")
    filepath = "tmp/matrix.mtx.gz"
    
    download(url, filepath)
    
    f = GZip.open(filepath)
    filecontents = read(f)
    close(f)
    
    open("tmp/matrix.mtx", "w") do f
        write(f, filecontents)
    end
    
    A = mmread("tmp/matrix.mtx")
    
    rm("tmp", recursive = true)
    
    A
end

end # module
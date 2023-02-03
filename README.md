# MMGet
Julia Package to get a Matrix Market matrix directly from the website.

Not an official package. Also, ChatGPT essentially wrote all the code. It started as a fun challenge, and now I have a package to more easily download MatrixMarket matrices.


## Expected use ##
Expected to pull from https://math.nist.gov/MatrixMarket/ subdomains.
An example of a good URL: "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/bcsstruc1/bcsstk01.mtx.gz"


## Behind the scenes ##
A folder named "tmp" is created or repurposed, and inside that folder 2 files with extensions ".mtx" and ".gz" are uniquely, randomly chosen. When the matrix is obtained, the "tmp" folder is deleted before the matrix is outputted from the function only if the directory did not already exist; otherwise only deletes the temporary files.


## How to add to Julia with Internet connection ##
```julia:
using Pkg
Pkg.develop(url="https://github.com/CHLOzzz/MMGet")
using MMGet
```


## Usage ##
`mmget(url::String)`: Get the matrix from the .gz download from MatrixMarket.


## Example code ##
```jl:
using Pkg
Pkg.develop(url="https://github.com/CHLOzzz/MMGet")
using MMGet

display(MMGet.mmget("https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/bcsstruc1/bcsstk01.mtx.gz"))
```


## Future plans ##
- Add URL error detection
- Add a method to download the .mtx matrix `mmdownload`

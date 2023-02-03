# MMGet
Julia Package to get a Matrix Market matrix directly from the website.

Not an official package. Also, ChatGPT essentially wrote all the code. It started as a fun challenge, and now I have a package to more easily download MatrixMarket matrices.


## Expected use ##
Expected to pull from https://math.nist.gov/MatrixMarket/ subdomains.
An example of a good URL: "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/bcsstruc1/bcsstk01.mtx.gz"


## Behind the scenes ##
A folder named "tmp" is created (if does not already exist), and inside that folder 2 randomly and uniquely named files with extensions ".mtx" and ".gz". When the matrix is obtained, the "tmp" folder is deleted (if created) before the matrix is outputted from the function. If the "tmp" folder already exists, only deletes the temporarily created files.


## How to add to Julia with Internet connection ##
```julia:
using Pkg
Pkg.add(url="https://github.com/CHLOzzz/MMGet")
using MMGet
```


## Usage ##
`mmget(url::String)`: Get the matrix from the .gz download from MatrixMarket.


## Example code ##
```jl:
using Pkg
Pkg.add(url="https://github.com/CHLOzzz/MMGet")
using MMGet

A = MMGet.mmget("https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/bcsstruc1/bcsstk01.mtx.gz")
display(A)
```


## Future plans ##
- Add URL error correcting / catching
- Add a method to download the .mtx matrix `mmdownload`
- Fix when it eventually breaks

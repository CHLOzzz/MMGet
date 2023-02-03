# MMGet
Julia Package to get a Matrix Market matrix directly from the website.

Not an official package.


## Expected use ##
Expected to pull from https://math.nist.gov/MatrixMarket/ subdomains.
An example of a good URL: "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/bcsstruc1/bcsstk01.mtx.gz"


## Behind the scenes ##
A folder named "tmp" is created, and inside that folder 2 files "matrix.mtx" and "matrix.mtx.gz". When the matrix is obtained, the "tmp" folder is deleted before the matrix is outputted from the function.


## How to add to Julia with Internet connection ##
`using Pkg`
`Pkg.develop(url="https://github.com/CHLOzzz/MMGet")`
`using MMGet`



## Usage ##
`mmget(url::String)`: Get the matrix from the .gz download from MatrixMarket.


## Example code ##
`using Pkg`
`Pkg.develop(url="https://github.com/CHLOzzz/MMGet")`
`using MMGet`

`display(MMGet.mmget("https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/bcsstruc1/bcsstk01.mtx.gz"))`

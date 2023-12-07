This tool tells you what to set `GOAMD64` to. 

`GOAMD64` is an optional go environment variable that can be set alongside `GOARCH=amd64`. 
It takes one of 4 possible values: `v1`,`v2`, `v3`, and `v4`. 
The default, `v1`, generates a working binary for all `GOARCH=amd64`targets, but is the least performant. 
Higher `v` values give better performance, on a smaller number of targets. See the official [documentation](https://github.com/golang/go/wiki/MinimumRequirements#microarchitecture-support) for more details.

### Steps
1. Clone this repo onto a machine which has go installed.
2. cd into the repo's src directory (`cd check-amd64/src`)
3. Run the bash script. Pass in the target `GOOS` (default is linux): `bash all.bash [GOOS]`
4. The `check_amd64_bins` directory should now have 4 binaries. Copy `check_amd64_bins` to your target.
5. cd into `check_amd64_bins` and run `./v1`. The output indicates which `GOAMD64` values will create working binaries on your target. 
   

### Example
My 2016 MacBook Pro has v3 microarchitecture support, but not 
v4. I can set `GOARCH=amd64 GOAMD64=v3` for  better performance.
```bash
$ ./v1 
v1 OK.
v2 OK.
v3 OK.
This program can only be run on AMD64 processors with v4 microarchitecture support.
Error running v4: exit status 1
```
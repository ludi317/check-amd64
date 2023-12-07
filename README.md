This tool tells you what to set `GOAMD64` to. 

`GOAMD64` is an optional go environment variable that can be set alongside `GOARCH=amd64`. 
It takes one of 4 possible values: `v1`,`v2`, `v3`, and `v4`. 
The default, `v1`, generates a working binary for all `GOARCH=amd64`targets, but is the least performant. 
Higher `v` values give better performance, on a smaller set of targets. See the official [documentation](https://github.com/golang/go/wiki/MinimumRequirements#microarchitecture-support) for more details.

### Shortcut for linux
1. Copy the `check_linux_amd64_bins` directory to your target.
2. cd into `check_linux_amd64_bins` and run `./v1`.


### Steps for other OSes
1. Clone this repo onto a machine which has go installed.
2. cd into the repo (`cd check-amd64`)
3. Run `make`. Optionally pass in the target `GOOS` (default is linux): eg, `make GOOS=darwin`. The `build/check_amd64_bins` directory should now have 4 binaries. 
4. Copy the `check_amd64_bins` directory to your target, if necessary. 
5. cd into `check_amd64_bins` and run `./v1`. The output indicates which `GOAMD64` values will create working binaries for your target. 


### Example
My MacBook Pro (Retina, 15-inch, Mid 2015) has v3 microarchitecture support, but not 
v4. Building go binaries with `GOARCH=amd64 GOAMD64=v3` will give better performance over the default `v1`.
```bash
$ ./v1 
v1 OK.
v2 OK.
v3 OK.
This program can only be run on AMD64 processors with v4 microarchitecture support.
Error running v4: exit status 1
```

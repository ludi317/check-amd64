package main

import (
	"os"
	"os/exec"
)

var goamd64 string

func main() {
	if goamd64 == "v1" {
		println(goamd64, "OK.")
		// This binary is the main caller
		versions := []string{"v2", "v3", "v4"}
		for _, ver := range versions {
			cmd := exec.Command("./" + ver)
			cmd.Stdout = os.Stdout
			cmd.Stderr = os.Stderr
			err := cmd.Run()
			if err != nil {
				println("Error running", ver+":", err.Error())
			}
		}
	} else {
		// Behavior for v2, v3, v4 binaries
		println(goamd64, "OK.")
	}
}

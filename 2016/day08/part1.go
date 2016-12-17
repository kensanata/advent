package main

import (
	"fmt"
)

type display struct {
	runes [5][60]rune
}

func (d *display) initialize() {
	for y := 0; y < 5; y++ {
		for x := 0; x < 60; x++ {
			d.runes[y][x] = '.'
		}
	}
}

func (d *display) print() {
	for y := 0; y < 5; y++ {
		for x := 0; x < 60; x++ {
			fmt.Printf("%c", d.runes[y][x])
		}
		print("\n")
	}
}

func main() {
	var d display
	d.initialize()
	d.print()
}

package main

import (
	"bytes"
	"bufio"
	"log"
	"os"
	"regexp"
	"strconv"
	"fmt"
)

const maxX= 50
const maxY = 6

type display struct {
	runes [maxY][maxX]rune
}

func (d *display) initialize() {
	for y := 0; y < maxY; y++ {
		for x := 0; x < maxX; x++ {
			d.runes[y][x] = '.'
		}
	}
}

func (d *display) string() string {
	var buf bytes.Buffer
	for y := 0; y < maxY; y++ {
		for x := 0; x < maxX; x++ {
			buf.WriteRune(d.runes[y][x])
		}
		buf.WriteString("\n")
	}
	return buf.String()
}

func (d *display) print() {
	print(d.string())
}

func (d *display) rect(a, b int) {
	for y := 0; y < b; y++ {
		for x := 0; x < a; x++ {
			d.runes[y][x] = '#'
		}
	}
}

func (d *display) rotateColumn(x, n int) {
	result := make([]rune, maxY)
	for y := 0; y < maxY; y++ {
		result[(y + n) % maxY] = d.runes[y][x]
	}
	for y := 0; y < maxY; y++ {
		d.runes[y][x] = result[y]
	}
}

func (d *display) rotateRow(y, n int) {
	result := make([]rune, maxX)
	for x := 0; x < maxX; x++ {
		result[(x + n) % maxX] = d.runes[y][x]
	}
	for x := 0; x < maxX; x++ {
		d.runes[y][x] = result[x]
	}
}

func (d *display) count() int {
	n := 0
	for y := 0; y < maxY; y++ {
		for x := 0; x < maxX; x++ {
			if d.runes[y][x] == '#' {
				n++
			}
		}
	}
	return n
}

func readStdin() display {
	var d display

	d.initialize()

	// rect 3x2
	reRect := regexp.MustCompile(`^(rect) (\d+)x(\d+)`)
	reRotRow := regexp.MustCompile(`^(rotate row) y=(\d+) by (\d+)`)
	reRotColumn := regexp.MustCompile(`^(rotate column) x=(\d+) by (\d+)`)

	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {

		// identify the command
		s := scanner.Text()
		match := reRect.FindStringSubmatch(s)
		if match == nil { match = reRotRow.FindStringSubmatch(s) }
		if match == nil { match = reRotColumn.FindStringSubmatch(s) }
		if match == nil { log.Fatal("Unknown command: ", s) }
		command := match[1]

		// convert the parameters to integers
		param := make([]int, len(match) - 1)
		for i := range match[2:] {
			n, err := strconv.Atoi(match[i+2])
			if err  != nil {
				log.Fatal(match[i+1], " cannot be converted to an integer")
			}
			param[i] = n
		}

		// run the commands
		switch command {	
		case "rect":
			d.rect(param[0], param[1])
		case "rotate row":
			d.rotateRow(param[0], param[1])
		case "rotate column":
			d.rotateColumn(param[0], param[1])
		default:
			log.Fatal("Matching regular expression is not handled: ", s)
		}

		// debug
		fmt.Println(s)
		d.print()
	}
	
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
	fmt.Println("Pixels:", d.count())
	return d
}

func main() {
	d := readStdin()
	d.print()
}

package main

import (
	"testing"
	"fmt"
)

func TestInit(t *testing.T) {
  var d display
  d.initialize()
	if len(d.string()) != maxY * (maxX + 1) {
    t.Error("Expected ", maxY * maxX, " pixels, got ", len(d.string()) - maxY)
  }
}

func TestRect(t *testing.T) {
  var d display
  d.initialize()
	d.rect(3, 2)
	correct := `###...............................................
###...............................................
..................................................
..................................................
..................................................
..................................................
`
	if d.string() != correct {
    t.Error(fmt.Sprintf("Expected the following:\n%sBut got:\n%s",
			correct, d.string()))
	}
}

func TestRotateColumn(t *testing.T) {
  var d display
  d.initialize()
	d.rect(3, 2)
	d.rotateColumn(1, 1)
	correct := `#.#...............................................
###...............................................
.#................................................
..................................................
..................................................
..................................................
`
	if d.string() != correct {
    t.Error(fmt.Sprintf("Expected the following:\n%sBut got:\n%s",
			correct, d.string()))
	}
}

func TestRotateRow(t *testing.T) {
  var d display
  d.initialize()
	d.rect(3, 2)
	d.rotateColumn(1, 1)
	d.rotateRow(0, 4)
	correct := `....#.#...........................................
###...............................................
.#................................................
..................................................
..................................................
..................................................
`
	if d.string() != correct {
    t.Error(fmt.Sprintf("Expected the following:\n%sBut got:\n%s",
			correct, d.string()))
	}
}

func TestRotateWrapping(t *testing.T) {
  var d display
  d.initialize()
	d.rect(2, 4)
	d.rotateColumn(0, 4)
	correct := `##................................................
##................................................
.#................................................
.#................................................
#.................................................
#.................................................
`
	if d.string() != correct {
    t.Error(fmt.Sprintf("Expected the following:\n%sBut got:\n%s",
			correct, d.string))
	}
}

func TestCount(t *testing.T) {
  var d display
  d.initialize()
	d.rect(2, 4)
	if d.count() != 8 {
    t.Error("Expected 8 pixels, got ", d.count())
	}
}

%.class: %.java
	javac $<

all: Part1.class Part2.class
	java -cp . Part1 < data
	java -cp . Part2 < data

clean:
	rm *.class

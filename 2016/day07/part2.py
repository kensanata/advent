import fileinput
import re

def check_line(line):
    inside = []
    outside = []
    for part in re.findall('([a-z]+)(?:\[([a-z]+)\])?', line):
        outside.append(part[0])
        if part[1]:
            inside.append(part[1])
    for word in outside:
        for a, b, c in zip(word, word[1:], word[2:]):
            if a == c and a != b:
                for other in inside:
                    if b + a + b in other:
                        return 1

def check_input():
    sum = 0
    for line in fileinput.input():
        if check_line(line):
            sum += 1
    return sum
    
if __name__ == '__main__':
    print (str(check_input()))

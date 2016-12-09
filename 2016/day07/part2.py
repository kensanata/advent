import sys
import re

def check_line(line):
    inside = []
    outside = []
    for part in re.findall('([a-z]+)(?:\[([a-z]+)\])?', line):
        outside.append(part[0])
        if part[1]:
            inside.append(part[1])
    for word in outside:
        for i in range(len(word) - 2):
            if word[i] == word[i+2] and word[i] != word[i+1]:
                for other in inside:
                    if re.search(word[i+1] + word[i] + word[i+1], other):
                        return 1

def check_input():
    sum = 0
    for line in sys.stdin:
        if check_line(line):
            sum += 1
    return sum
    
if __name__ == '__main__':
    print (str(check_input()))

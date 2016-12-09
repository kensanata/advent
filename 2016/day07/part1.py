import sys
import re

def has_palindrome(word):
    m = re.search(r"([a-z])([a-z])\2\1", word)
    # aaaa is not a valid palindrome
    if (m and m.group(1) != m.group(2)):
        return 1

def check_line(line):
    inside = 0
    outside = 0
    parts = re.findall('([a-z]+)(?:\[([a-z]+)\])?', line)
    for part in parts:
        if (has_palindrome(part[0])):
            outside += 1
        if (has_palindrome(part[1])):
            inside += 1
    return inside == 0 and outside > 0

def check_input():
    sum = 0
    for line in sys.stdin:
        if check_line(line):
            sum += 1
    return sum
    
if __name__ == '__main__':
    print (str(check_input()))

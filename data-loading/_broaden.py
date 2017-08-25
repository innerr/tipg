import sys

n = int(sys.argv[1])

while True:
    line = sys.stdin.readline()
    if not line:
        break
    if n <= 32:
        print line[:-1] * n
    else:
        print line[:-1] + 'X' * n + '|'

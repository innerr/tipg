import sys

n = int(sys.argv[1])

while True:
    line = sys.stdin.readline()
    if not line:
        break
    print line[:-1] * n

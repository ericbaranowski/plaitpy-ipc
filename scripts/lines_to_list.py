import json
import sys

lines = sys.stdin.readlines()

ret = []
for line in lines:
    data = json.loads(line)
    ret.append(data)

s = json.dumps(ret)
print "var DATA = %s" % s

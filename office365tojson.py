# coding: utf-8
#!/usr/bin/env python

import re
import sys
import json
import argparse
import os.path

data = ""

def office365tojson(filename, indexname=""):
    if indexname == "":
        indexname = filename[:filename.rfind(".")]
    records = []
    output = filename[:filename.rfind(".")] + ".json"

    with open(filename,"r") as f:
        data = f.read().split("\n")
    for i in range(1,(len(data)-1)):
        line = data[i]
        index=[m.start() for m in re.finditer(r",",line)][2]
        portion = line[index:]
        portion = portion[portion.index('{'):]
        portion = portion.replace('""','"')
        portion = portion.strip()
        record = json.loads(portion[0:-1])
        indexrecord = {"index":{"_index":indexname,"_id":i}}
	with open(output,"a") as o:
		o.write(json.dumps(indexrecord)+'\n')
		o.write(json.dumps(record)+'\n')
	records.append(indexrecord)
        records.append(record)

def main():
    if len(sys.argv) < 2:
        print "Usage {} [filename] (optional index-name)"
    else:
        if os.path.isfile(sys.argv[1]):
            office365tojson(sys.argv[1],"office365audit")
        else:
            print "[*] Error: Filename does not exist"
            exit(-1)

if __name__ == "__main__":
    main()


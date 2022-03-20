import re

def parseImplCi(file):
    f = open(file, "r").read()
    r = re.sub(".php:.{2,3,4}:.*function ", "/", f)
    print(r)

parseImplCi("/controllers/dummyFn")
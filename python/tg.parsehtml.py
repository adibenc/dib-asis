from bs4 import BeautifulSoup

#dib tools
class AppBs():
    def __init__(self, fname):
        self.content = open(fname, "r").read()
        self.soup = BeautifulSoup(self.content, 'html.parser')
    
    def allLink(self, inArr, na):
        for link in self.soup.find_all('a'):
            l = link.get('href')
            if na not in l:
                print(l)

def getAllFiles(path):
    from os import listdir
    from os.path import isfile, join
    onlyfiles = [f for f in listdir(path) if isfile(join(path, f))]

    return onlyfiles

print()
rootdir = "/home/zam/Downloads/Telegram Desktop/ChatExport_2020-10-02/"
allFile = getAllFiles(rootdir)

for f in allFile:
    ab = AppBs(rootdir+f)
    ab.allLink([], 'message')

# print(ab.allLink([], []))
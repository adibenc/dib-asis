"""

for personal usage only
adib35785@gmail.com

"""
import requests
from bs4 import BeautifulSoup
import random
import os

class Subject:
    crawlResult = []

    def __init__(self, fullname, alias):
        self.fullname = fullname
        self.alias = alias
        a=1

    def setChild(self, subject):
        self.child = subject

    def getKeywords(self):
        return self.alias+[self.fullname]
    
    def getOutputPrefix(self):
        return self.fullname[0:3]
    
    def initCrawler(self):
        print("crawle inited at subject "+self.fullname)
        c = Crawler()
        return 1
    
    def __repr__(self):
        return "Subject::"+self.fullname+"::"+self.alias

class Parser:
    def __init__(self, content):
        self.content = content

    def bsoup(self):
        soup = BeautifulSoup(self.content, 'html.parser')
        return soup

class Crawler:
    # search subject in urls
    def __init__(self,name="crawler",tofile=True):
        # self.tofile = False
        self.tofile = tofile
        self.crawlCnt = 1
        self.name = name
        a=1
    
    # crawl from single url
    def crawlSingle(self, url):
        # no ssl crawl
        # requests.Session()
        req = requests.get(url,verify=False)
        content = req.text

        if self.tofile:
            self.toFile("p"+str(self.crawlCnt)+".html",content)
        else:
            print(content)
        
        self.crawlCnt+=1

        return content

    # crawl from all urls
    def crawl(self):
        print("crawling..")

        crawlResult=[]
        for i,url in enumerate(self.urls):
            # res="crawl result %d"%i
            # keywords = self.subject.getKeywords()
            res = self.crawlSingle(url)
            # crawlResult.append(res)

        self.subject.setCrawlResult(crawlResult)

        print("finished crawling..")

        return 1
    
    def toFile(self,name,write):
        f = open(name,'w').write(write)
        # if os.exist("result")
        # os.mkdir("result")
        # append filename to result/output endline
        # f = open("output",'w').write(name)

        return 1
    
    def __repr__(self):
        return "Crawler::"+self.name

# abstract subject crawl

class SubCrawl:
    def __init__(self):
        a=1
    
    def doCrawl(self):
        """
        implementation example:

        urls = "https://repository.ipb.ac.id/handle/123456789/77/discover?rpp=20&etal=0&query=algoritma&group_by=none&page=%d"
        print(urls%(1))
        arr = [urls%(x) for x in range(1,14+1)]
        c = Crawler()

        for url in arr:
            # print(url)
            res = c.crawlSingle(url)
            p = Parser(res)
            bsoup = p.bsoup()
            h4s = bsoup.find_all('h4')
            print(h4s)
        """
        raise NotImplementedError()

    def doParse():
        """
        implementation example
        
        arr = ["p"+str(x)+".html" for x in range(1,14+1)]

        for f in arr:
            content = open(f,'r').read()
            p = Parser(content)
            bsoup = p.bsoup()
            h4s = bsoup.find_all('h4')
            print(len(h4s))
            for h4 in h4s:
                print(h4.text)
            exit()
        """
        raise NotImplementedError()
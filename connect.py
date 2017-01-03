#!/usr/bin/env python3

import urllib.request, urllib.parse, urllib.error, sys, os

"""
Get arg, set data and create POST request

"""
#details = urllib.parse.urlencode({'user' : 'b', 'passwd' : 'a', 'temperature' : sys.argv[1]})
details = urllib.parse.urlencode({'temperature' : sys.argv[1]})
details = details.encode('UTF-8')
url = urllib.request.Request("http://silenyprojektik.4fan.cz/zpracuj.php", details)
url.add_header("User-Agent","Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.2.149.29 Safari/525.13")
response = urllib.request.urlopen(url).read().decode('utf8', 'ignore')

print(response)
print("connect", sys.argv[1])



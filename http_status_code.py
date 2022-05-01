'''
HTTP Status Code v0.1

Github: https://github.com/ilstar/http_status_code
Author: Fred Liang
'''

import sys
import csv

from feedback import Feedback

query = sys.argv[1]
query = query.lower()
baseurl = 'https://httpstatuses.com/'

fb = Feedback()

with open('status_code.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        code, desc = row
        lower_desc = desc.lower()

        if code.find(query) != -1:
            fb.add_item(desc, code, arg=baseurl + code)
        elif lower_desc.find(query) != -1:
            fb.add_item(code, desc, arg=baseurl + code)

print(fb)

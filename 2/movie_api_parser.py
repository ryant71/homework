#!/usr/bin/env python3.8

import sys
import requests

# My webserver where I have placed sample json
# for testing purposes.
URL='https://hiredgnu.net/example.json'
HEADERS = {"Content-Type": "application/json"}

# Make HTTP GET
res = requests.get(URL, headers=HEADERS)

# Read the expected json response
# catch and exception and exit gracefully
# is response is not valid json
try:
    json_response = res.json()
except JSONDecodeError:
    print('Response is not valid JSON')
    sys.exit()

# response is a list of dictionaries which
# can be counted with len()
total = len(json_response)

# instantiate counter and loop over
# list of dictionaries.
matched = 0
for item in json_response:
    if int(item['rating']) <= 16 and item['plus_only']:
        matched += 1
        print(item['name'])

print(f'Total programs found: {total}, Total programs matching criteria: {matched}')

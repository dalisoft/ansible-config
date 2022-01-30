#!/usr/bin/python
from http import client

HOSTS_EXTERNAL_URL = [
	['raw.githubusercontent.com', '/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt'],
	['raw.githubusercontent.com', '/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts'],
	['raw.githubusercontent.com', 'AdAway/adaway.github.io/master/hosts.txt'],
	['raw.githubusercontent.com','/r-a-y/mobile-hosts/master/AdguardDNS.txt'],
	['o0.pages.dev', '/Pro/hosts.txt'],
	['block.energized.pro', '/ultimate/formats/hosts.txt']
]

def bytes2utf (bytelist: list[bytes]) -> list[str]:
	return [line.decode('utf-8') for line in bytelist]

defaults = open('defaults.txt', 'r')
defaults_lines = defaults.readlines()

whitelist = open('whitelist.txt', 'r')
whitelist_lines = whitelist.readlines()

custom_host = open('dalisoft.txt', 'r')
custom_host_lines = custom_host.readlines()

# Utils
def request(url: str, path: str) -> list[str]:
	conn = client.HTTPSConnection(url)
	conn.request('GET', path)
	bytelist = conn.getresponse().readlines()
	res = bytes2utf(bytelist)
	res = set(res)
	res = list(res)
	conn.close()
	return res

# Checks
def checkComments (line: str) -> bool:
	if '#' in line or line.__len__() < 2:
		return True

	return False

def checkWhitelist (line: str) -> bool:
	for whitelist_line in whitelist_lines:
			whitelist_line: str = whitelist_line.replace('*.', '') if '*' in whitelist_line else ' {}'.format(whitelist_line)
			if checkComments(whitelist_line) is False and whitelist_line in line:
				return True

	return False

# All list
output_list: list[str] = []

print('Generating hosts... 0%')

# Blocks
for line in custom_host_lines:
	if checkWhitelist(line) is False and checkComments(line) is False:
		output_list.append(line)

index = 1
length = len(HOSTS_EXTERNAL_URL) + 1
for host, path in (HOSTS_EXTERNAL_URL):
	host_list = request(host, path)

	for line in host_list:
		if checkWhitelist(line) is False and checkComments(line) is False:
			line = line.replace('127.0.0.1', '0.0.0.0')
			output_list.append(line)

	print('Generating hosts... {}%'.format(int((index / length) * 100 )))
	index += 1

## IP Generation block
ip_list = request('block.energized.pro', '/extensions/ips/formats/list.txt')
for line in ip_list:
	if checkWhitelist(line) is False and checkComments(line) is False:
		output_list.append('0.0.0.0 {}'.format(line))

print('Generating hosts... 100%')

# Save hosts
print('Building blocks...')

hosts_file = open('hosts', 'w')
hosts_file.writelines(list(set(defaults_lines)))
hosts_file.writelines(list(set(output_list)))

# Close files
hosts_file.close()
defaults.close()
whitelist.close()
custom_host.close()

print('Done...')

def isconnected(mode):
#mode 'bool' or others: return true/false
#mode 'code' return http code
#mode 'ip' return ip
	import requests
	print("mode selected: " +str(mode))
	r =  requests.get('https://api.ipify.org?format=json')
	if mode == 'ip':
		r = r.json()
		return r["ip"]
	elif mode == 'code':
		return r.status_code
	else:
		if r.status_code == 200:
			return True
		else:
			return False

#print("r.status_code="+str(r.status_code))
'''
print("=====")
print(isconnected('a'))
print(isconnected('ip'))
print(isconnected('code'))
print(isconnected('bool'))
'''

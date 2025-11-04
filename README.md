# govpn
api for govpn app

# Example
```nim
import asyncdispatch, govpn, json

discard waitFor get_token()

let data= waitFor random_server()

let server_data = data["data"]["server_data"]

echo server_data["name"].getStr()
echo server_data["countryName"].getStr()
echo server_data["accessType"].getStr()
echo server_data["ipAddress"].getStr()
echo server_data["port"]
echo server_data["protocol"].getStr()
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```

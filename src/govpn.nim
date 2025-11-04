import asyncdispatch, httpclient, json, strutils

const api = "https://api.govpn.ai/api"
var headers = newHttpHeaders({"Connection": "keep-alive",  "Host": "api.govpn.ai",  "Content-Type": "application/json",  "accept": "application/json, text/plain, */*", "user-agent":"okhttp/4.12.0"})

proc get_token*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.post(api & "/Auth/GenerateMobileToken",body="")
    let body = await response.body
    let json = parseJson(body)
    headers["Authorization"] = "Bearer " & json["token"]["result"].getStr()
    result=json
  finally:
    client.close()

proc random_server*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.post(api & "/Mobile/get-random-server",body="")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc premium_servers*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.post(api & "/Mobile/country-list-With-Premium-Servers",body="")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc country_list*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.post(api & "/Mobile/countrylist",body="")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

# Переменные url
$count = "500"
$price = "tierFree"
$url = "https://store.epicgames.com/ru/browse?sortBy=releaseDate&sortDir=DESC&priceTier=$($price)&category=Game&count=$($count)&start=0"
# Делаем запрос
$userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
$handler = New-Object System.Net.Http.HttpClientHandler
$handler.AllowAutoRedirect = $true
$httpClient = New-Object System.Net.Http.HttpClient($handler)
$requestMessage = [System.Net.Http.HttpRequestMessage]::new([System.Net.Http.HttpMethod]::Get, $url)
$cookies = "_epicSID=02a090e5d57e4871b65dd8428e1e7e9d; EPIC_DEVICE=135b970ad0234529a9ff86da9fbb85c5; _tald=1eff0c25-44c9-4955-937d-051890c790a6; MUID=23f4ced20b014432ad5255084a9fec1e; egs_age_gate_dob=1985-0-1; HasAcceptedAgeGates=Russia%3A18; EPIC_SSO_RM=35043536c3b14d6499a2287a6ce9ff1f; cf_clearance=thCaM2I.HnC9I_cnJNFRGYpyeURett1uNGWkQkosr9Y-1714662264-1.0.1.1-ybpSmG8XMCK9w2NSfZfeEcM8yoF1_K9loEUoWkCZ8tj1a8CFHBRoMwugBE1B7jI0axTnl5e8tcQFnFXRVotUaA; fptctx2=taBcrIH61PuCVH7eNCyH0HyAAKgSb15ZEqidLg30r8PxwbRildtlmoSLKnhl7dQOUJGCEy%252bpCNMCu4B8MVafOJ%252b29L606iFfk7ZO8KoVI0f2j%252b3Dwk74LepyRTF6DnbgIYcULN0AqHQfQagxhGbkheiHzCKq0vv4DtJjUtZu54qo418GhEAFB7icaoiRr342UtwWKABMboyswnPIoAVx%252fyKouew%252fy9SdukBqfYaySnVnymDKHwOuPBNC8MyQkRZcPvzFbjDpvO5Ti46D16JCBlp5iBdmkRUMFKlQItBu836Cexox28NmsX3wi%252faq0h5b45GWHemdDfH%252fYDVKdeRwQsVKgNvJKBQnaW1U9gT2l5k%253d; cf_clearance=6shPe_IFNS.Q.YAgT902MJ6kddYGW83v4i2v4njIdM0-1715168576-1.0.1.1-B2tHaQa5OmO.vrFscRWMxZ.btNkeXMIYyVVf_4YmsKLDsGdfsfCFiXIAO_EbzsTmNBOKmiI1gTe_JEiFkBBnzg; EPIC_LOCALE_COOKIE=ru; EPIC_EG1=eg1~eyJraWQiOiJnX19WS2pTU21xSjB4WmoxUllrTEdLUTdkbkhpTTlNTGhGVndLUHlTREI0IiwiYWxnIjoiUFMyNTYifQ.eyJhcHAiOiJkaWVzZWx3ZWIiLCJzdWIiOiIwOGI1YmRkN2QwMDA0MWU1YmQ5N2YzNjJjZmI0MDZjMSIsImR2aWQiOiIxMzViOTcwYWQwMjM0NTI5YTlmZjg2ZGE5ZmJiODVjNSIsIm12ZXIiOmZhbHNlLCJjbGlkIjoiODc1YTNiNTdkM2E2NDBhNmI3ZjliNGU4ODM0NjNhYjQiLCJkbiI6IkxpZmFpbG9uNTciLCJhbSI6InRva2VuX3RvX3Rva2VuIiwicCI6ImVOcWxWdHR1NGpBUS9aK0tTdERycmlVK1lLVjlXdTBQVE93SmpQQk52dEN5WDc5ams2U0JnaExhSnh3ODl6bHp4ajQ0bFdVU1BqZWFwUERIejdoK1dJQ1VMdHNrdXQ4b2xqK2E1MGFwVjdWY0xwOVd5T2Vmciszank0TnNtNmZsaTF3Smd3a1VKR0RsZ0h2Q3Q5NXFRTzlDRWduQ0J0TjZ0WkRPbUd4SlFpSm5veUNiTUZqUUxBZEtSRXlKN0thRWNDYUg3NTFjSDFxeDloRm81Nnovdk9NcmhYdlV6bVB3Z2ZZZ0Q0UHh5V1RXTHd0TlRZQnc2TzFTUWxPQ2lybUpNcEF2TWZWM2s2VVpLN0VOdEltU1JzTy9OVTJGQVJXYTIyd1d0YTVLSGlLWGgydTJHcHNlU2pGcGFxUjBMY1h4Zi9jS1d4YnpwOWlKWUZYajNtdE1tRFdrQUhMSHhSWnhDNXdlZHpkNmJpTnVLU1lYRGlWeUJvdDJnNEJyV3d4RjJ6ZzFHUDFBdzZXb0JLa2ErK0dYT3EveFpWaHdYMGZXK1ZnTU8wa1ZWWW4yYktxN3ZKSUYvNE14d1NiZ2xmWU4yU3FXV0Q4empHS2EzZE0zaXR1aXNGNDluMWZuN2p0SXlhWHlvdVdnMTQrTE5oQmFOV01HT0lpSVlVOFN5WExPVmlMSGNGTSt5VUVzTmI4MnlaSkhQbUhmWllidktYRm8ydUhuU1p6MDZqVWNFaGtVb1BWVm5ESXJHSXJ4Q0JZWE5tRHBYdzFQZ0RKazV3L1BXRGRXZDF3d3RCdXllSUpzVVMrcU0xVVl5VW1NMFlYNUhBSWE0NTlLcGVmWUhIajJPR0V6T3J2d2NLZ2NNUnVaWE10S3R6ZjFYd0lIdTFvdEd1M2s3bmZSbkE3dDZUeTIvblBTRytTMGxlQS9iNWdCYitNTlUzTzVEVmpTY1JGa0paZ3lHMHhqcUNoS3Q4Y1BJOGw1a2dVSEdyS1ZXKzU3NzZYZklGLzNXazJVZXZvYzVCYTQwd05uRHQ0K1h6V1p0Q0xiT2xGUGh0SGFNb2RWUnZuU05wTWF5TnczYUxHbHNzL25FZ3A3NUxKNVRtZG9MWjk1d0FPK1FWQ3ovUi9GNy91WHllV1o0d0V6cnFRVnNzWnZ2V2Rxb1hvSTlhemN4Ym9CYzdxRVhWbkNaOVI5cGZGTXFRbi91aDNhZXN4RnBNMjZKYTNIOEMra1h3YzJKSXVoUEpZMjRVaFV1UkRkbktmTUpiSmc0QmIxWVpOTjIzbjRNaEZmN2xBbE5INmgxUzFxZUpLZzJ6YmxLVk5tYS9SRU9DMzNmL21EdXNzPSIsImlhaSI6IjA4YjViZGQ3ZDAwMDQxZTViZDk3ZjM2MmNmYjQwNmMxIiwic2VjIjowLCJhY3IiOiJ1cm46ZXBpYzpsb2E6YWFsMSIsImNsc3ZjIjoiZGllc2Vsd2ViIiwidCI6InMiLCJhdXRoX3RpbWUiOjE3MTUxNjg1NzMsImljIjp0cnVlLCJleHAiOjE3MTUyMjU0MjAsImlhdCI6MTcxNTE5NjYyNCwianRpIjoiODY5MWEwNzhmODhmNGYxZjhkOWRjNWVkZjVkZjdiOGIifQ.KN8ycKufcs5wFEYJYm9nAq7FVlHNABw5Q8gpnPk27hPfh-95_X7CaAr_mT3FSlJfRRCHnLsMS5pQxDrcuX1MOoVUE5a6_9rIETZHRT3AQhKEgokUgWX_4gxfGq2UJZalT8SDtn4G4hHftGQvrnb993K61Sji9jTuxcv4-0i500opihNbrLaWjd8DLQrOFr2Lm-j1OsqbZbOHzmkeJwYdHVN9_73Qo-j5TDcMkHyqyZRPLWtHLMClf9nxiLSkvCDrSboO1-yrhFz79J5A0WU-0kEim7n7WsY16E3sHD8k370DVmgwMZ-YHp4vGP5lza4gk7EzeW6ega0uPIq2p8em4Y4OulrNa9wED1aANl5NG2WHKa7-TF6rtB5or9J-nWRmIs5LYRB7k8FEnVNTFQsGvBMMa_SLbNhy11W6Rz4izIgbViTu4TqDyF2U0nXQyUn6Bx8-V-mMHjQluogaQlZjra13L1KW-N8Czt5bT0CTH14zq8LH1lEZnCS5iamIAXFAacNAV-BbNoFhE8YEP8iLdQ8f-M4kdR1RptHVym-rJ-_nYlMBdKI3qBdqyIN56NNXr6CmQRsnJ0J3rh-TuH8jzwb03tVWhkCQX_eyw6OwKTPyQFRReMeZDwjQgY5UoywRQRY7ggCCtJP_gGFexBKB2_OsrD7MvdBV1Li4DsSQfng; REFRESH_EPIC_EG1=eg1~eyJraWQiOiJnX19WS2pTU21xSjB4WmoxUllrTEdLUTdkbkhpTTlNTGhGVndLUHlTREI0IiwiYWxnIjoiUFMyNTYifQ.eyJzdWIiOiIwOGI1YmRkN2QwMDA0MWU1YmQ5N2YzNjJjZmI0MDZjMSIsImR2aWQiOiIxMzViOTcwYWQwMjM0NTI5YTlmZjg2ZGE5ZmJiODVjNSIsInQiOiJyIiwiY2xpZCI6Ijg3NWEzYjU3ZDNhNjQwYTZiN2Y5YjRlODgzNDYzYWI0IiwiZXhwIjoxNzE1MzExODI0LCJhbSI6InRva2VuX3RvX3Rva2VuIiwianRpIjoiNTYyYzMzN2U0NjM2NGNlYTg4OWJkMjI2MGFlNTAzNjAifQ.F6KcEgnHXe_aUvfpwrdgO7HpGw8nUsjqPDWlBDva62sVyJWjHHr5keYHmS8ylDqqdrj8APTE2uAYKcQzeEaXzAqIUkx0pJH9UHQlLdKzLwW5aR5NCx_cZ6LIZ8z0aKF1kWIdgWbKBMvGSzqWY7EihoqQM5SsbUmesEWPXRCIagPbiAVV7ZgHc2t3ilXjN3837QEadnmwl9I1K_t9-FoVNd7ip_-1yjkzI4WcafDlNPEZBTY4cEHDvh328iHFWrPsGU4R1Wu3w3LfhEEE9SIgPNyhWuh8RddT9jZIhmR5LTcMOmkRjg-F4tCueLzweJbMn_m_4FDerzK7ECw5hCKiq_-jNWdAmxMfxj7ER9tZtIYMNP8WfiPp8hJvZ3fafne0Jk0k2QRQ1200xsc0ViEEykV7By2IqgK6eFmv2J9XdXgcfqpHJdbxrdScyhIW_GcGktI8bKjNvqWFh_pvX9OB4bQx2FuxgDZB4KkFfiKnU2Y4n6-p8G77zO1jIpjDfkej6vrJ5pNzOUxMYEGJpswfk2e6LWuu32EEsjUPxOpdsVt9HxYYlBRjupHuVMJqE9IxK3OQvc9-rVL0rH5VXKk3beIyVCoD2qGTFsa0gRBfy_bAO9l2rvaiqMvcv_VDxLkPwaNcGCWvJBNMgZfT7Rgl5dqm77e9Cl3iIPNg6E4EWIY; refreshTokenExpires=2024-05-10T03%3A30%3A24.347Z; storeTokenExpires=2024-05-09T03%3A30%3A20.346Z; __cf_bm=jVjDEEMpzy7_zKlS.HGYuDFHJ4O_klu24eBp5fuO49E-1715203566-1.0.1.1-P11ZEzx8YPkWPHTM_NCouWhhfy_umep7cMx.OTZxUATDisS6KcFtIEkxV5iV.C_26rC83Be_h2e8EdO7zWkVoQ"
$requestMessage.Headers.Add("Cookie", $cookies)
$requestMessage.Headers.Add("User-Agent", $userAgent)
$requestMessage.Headers.Add("Accept", "text/html")
$response = $httpClient.SendAsync($requestMessage).Result
$content = $response.Content.ReadAsStringAsync().Result
# Логируем (проверяем содержимое)
Write-Host "---------------------- Content ----------------------"
Write-Host $content
Write-Host "---------------------- Content ------------------------"
# Вытаскиваем json из html
$json = $($($($content -split "__REACT_QUERY_INITIAL_QUERIES__ = ")[1] -split "window.server_rendered")[0] -replace ";")
# Обрабатываем данные
$games = $($json | ConvertFrom-Json).queries.state.data[-1].catalog.searchStore.elements
# Сохраняем файл
$path = "${env:GITHUB_WORKSPACE}/json/FreeGames.json"
$games | ConvertTo-Json -Depth 10 | Out-File $path
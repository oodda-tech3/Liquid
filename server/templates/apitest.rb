require 'net/http'
require 'json'
require 'uri'

uri = URI.parse("http://admin-api.macrozheng.com/brand/list?pageNum=1&pageSize=100")
    request = Net::HTTP::Get.new(uri)
    request["Connection"] = "keep-alive"
    request["Accept"] = "application/json, text/plain, */*"
    request["Authorization"] = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0ZXN0IiwiY3JlYXRlZCI6MTYyNDA2MDU4OTcyMSwiZXhwIjoxNjI0NjY1Mzg5fQ.YE1XYvmnN-xpBxD_KT5dw3-W0IwS64-m6CmZ025SNctQFqP7YQFgKdnv20WKNXV9fXCQ-bXPOk6_OFzCcOXS8g"
    request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36"
    request["Origin"] = "http://www.macrozheng.com"
    request["Referer"] = "http://www.macrozheng.com/"
    request["Accept-Language"] = "en-US,en;q=0.9"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

obj = JSON.parse(response.body)
puts obj['data']

#puts "#{obj['data']}"
require "http"

store_http = "https://www.cheapshark.com/api/1.0/stores"
raw_response = HTTP.get(store_http)
raw_response_parsed = JSON.parse(raw_response)
raw_response_parsed.each do |x|
  data = ""
  data = x.fetch("storeID").to_s + "|" + x.fetch("storeName").to_s + "|" + x.fetch("isActive").to_s
  y = x.fetch("images")
  data = data + "|" + y.fetch("banner") + "|" + y.fetch("logo") + "|" + y.fetch("icon")
  pp data
  
end

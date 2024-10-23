require "http"
require "json"

# store_http = "https://www.cheapshark.com/api/1.0/stores"
# raw_response = HTTP.get(store_http)
# raw_response_parsed = JSON.parse(raw_response)
# raw_response_parsed.each do |x|
#   data = ""
#   data = x.fetch("storeID").to_s + "|" + x.fetch("storeName").to_s + "|" + x.fetch("isActive").to_s
#   y = x.fetch("images")
#   data = data + "|" + y.fetch("banner") + "|" + y.fetch("logo") + "|" + y.fetch("icon")
#   pp data
# end

# ----------------------------------------

# cheapshark_http = "https://www.cheapshark.com/api/1.0/deals?"
  
# store = 1
# lowerprice = 0
# upperprice = 15
# metacritic = 80
# aaa = 0
# title = ""
# request = "#{cheapshark_http}&storeID=#{store}&lowerPrice=#{lowerprice}&upperPrice=#{upperprice}&metacritic=#{metacritic}&AAA=#{aaa}&pageNumber=0"
# raw_response = HTTP.get(request)
# parsed_response = JSON.parse(raw_response)

# system("clear")

# parsed_response.each do |x|
#   pp x.fetch("title") + " | " + x.fetch("salePrice").to_s
# end



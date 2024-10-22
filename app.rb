require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

set :public_folder, __dir__ + '/static'

get("/") do
  redirect("/search")
end

get("/search") do
  erb(:search)
end

get("/sales") do
  cheapshark_http = "https://www.cheapshark.com/api/1.0/deals?"
  
  store = params.fetch("store")
  lowerprice = params.fetch("lowerprice")
  upperprice = params.fetch("upperprice")
  metacritic = params.fetch("metacritic")
  aaa = params.fetch("AAA")
  title = params.fetch("title")
  page ||= params.fetch("pagenumber")
  
  case store
  when "Steam"
    @store_code = 1
  when "GOG"
    @store_code = 7
  when "Green Man Gaming"
    @store_code = 3
  end
  
  request = "#{cheapshark_http}&storeID=#{store}&lowerPrice=#{lowerprice}&upperPrice=#{upperprice}&metacritic=#{metacritic}&AAA=#{aaa}&pageNumber=0"
  raw_response = HTTP.get(request)
  parsed_response = JSON.parse(raw_response)

  system("clear")


  erb(:sales)
end

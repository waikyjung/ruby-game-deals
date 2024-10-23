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
  case store
  when "Steam"
    store_code = 1
  when "GOG"
    store_code = 7
  when "Green Man Gaming"
    store_code = 3
  end

  lowerprice = params.fetch("lowerprice")
  upperprice = params.fetch("upperprice")
  metacritic = params.fetch("metacritic")
  params[:AAA] ? aaa = params.fetch("AAA") : aaa = ""
  aaa == "yes" ? aaa_option = "&AAA=0" : aaa_option = ""
  params[:title] ? title = params.fetch("title") :  title = ""
  title.to_s.length > 0 ? title_option = title : title_option = ""
  pagenumber = params.fetch("pagenumber")


  request = "#{cheapshark_http}&storeID=#{store_code}&lowerPrice=#{lowerprice}&upperPrice=#{upperprice}&metacritic=#{metacritic}"
  request += aaa_option
  request += title_option

  raw_response = HTTP.get("#{request}&pageNumber=#{pagenumber}")
  parsed_response = JSON.parse(raw_response)
  @test = parsed_response
  erb(:sales)
end

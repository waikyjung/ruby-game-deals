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
    @store_code = 1
  when "GamersGate"
    @store_code = 2
  when "GOG"
    @store_code = 7
  when "Origin"
    @store_code = 8
  when "Humble Store"
    @store_code = 11
  when "Uplay"
    @store_code = 13
  when "Fanatical"
    @store_code = 15
  when "WinGameStore"
    @store_code = 21
  when "GameBillet"
    @store_code = 23
  when "Epic Games Store"
    @store_code = 25
  when "Gamesplanet"
    @store_code = 27
  when "IndieGala"
    @store_code = 30
  end

  lowerprice = params.fetch("lowerprice")
  upperprice = params.fetch("upperprice")
  metacritic = params.fetch("metacritic")
  params[:AAA] ? aaa = params.fetch("AAA") : aaa = ""
  aaa == "yes" ? aaa_option = "&AAA=0" : aaa_option = ""
  params[:title] ? title = params.fetch("title") :  title = ""
  title.to_s.length > 0 ? title_option = "&title=#{title}" : title_option = ""
  @pagenumber = params.fetch("pagenumber")

  data_request = "#{cheapshark_http}&storeID=#{@store_code}&lowerPrice=#{lowerprice}&upperPrice=#{upperprice}&metacritic=#{metacritic}"
  data_request += aaa_option
  data_request += title_option
  data_request += "&onSale=1"
  data_request += "&pageNumber="

  raw_response = HTTP.get("#{data_request}#{@pagenumber}")
  parsed_response = JSON.parse(raw_response)
  
  @sales = []
  parsed_response.each do |sale|
    @sales.push([
      sale.fetch("title"),
      sale.fetch("metacriticLink"),
      sale.fetch("salePrice"),
      sale.fetch("normalPrice"),
      sale.fetch("savings").to_f.round(0),
      sale.fetch("metacriticScore"),
      sale.fetch("steamRatingPercent"),
      sale.fetch("dealRating"),
      sale.fetch("thumb")
    ])
  end
  @test = data_request
  erb(:deals)
end

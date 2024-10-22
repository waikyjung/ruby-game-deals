require "sinatra"
require "sinatra/reloader"

set :public_folder, __dir__ + '/static'

get("/") do
  redirect "/search"
end

get("/search") do
  erb(:search)
end

get("/sales") do
  @store = params.fetch("store")
  @lowerprice = params.fetch("lowerprice")
  @upperprice = params.fetch("upperprice")
  @metacritic = params.fetch("metacritic")
  @aaa = params.fetch("AAA")
  @title = params.fetch("title")

  erb(:sales)
end

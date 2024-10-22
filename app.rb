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
  

  erb(:sales)
end

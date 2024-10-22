require "sinatra"
require "sinatra/reloader"

set :public_folder, __dir__ + '/static'

get("/") do
  erb(:search)
end

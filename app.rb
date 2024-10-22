require "sinatra"
require "sinatra/reloader"

set :public_folder, __dir__ + '/'

get("/") do
  erb(:search)
end

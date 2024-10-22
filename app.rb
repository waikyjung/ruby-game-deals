require "sinatra"
require "sinatra/reloader"

set :public_folder, File.dirname(__FILE__) + "/css"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  erb(:search)
end

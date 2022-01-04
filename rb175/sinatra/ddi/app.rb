require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @listing = Dir.glob("public/*").map do |file|
    file.split("/").last
  end

  @listing.sort! 
  erb :home
end

get "/reversed" do
  @listing = Dir.glob("public/*").map do |file|
    file.split("/").last
  end

  @listing.sort!.reverse! 
  erb :home
end

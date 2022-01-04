require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "pry"
require "yaml"

before do 
  @users = YAML.load_file('users.yaml')
  @num_users = @users.keys.count
  @num_interests = count_interests(@users)
end
helpers do
  def count_interests(users)
    users.map do |user, hash|
      hash[:interests].size
    end.sum
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :index
end

get "/:user" do
  @user = params[:user].downcase.to_sym
  redirect not_found unless @users.keys.include?(@user)
  erb :user_page
end

not_found do
  "404 error"
end

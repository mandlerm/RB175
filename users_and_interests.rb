require "sinatra"
require "sinatra/reloader"
require 'yaml'
require 'pry'

before do
  @names = YAML.load_file("./users.yaml")
end

get "/" do
  redirect "/users"
end

get "/users" do
  @people = @names.keys
  erb :names
end

get "/:user" do
  @name = params[:user]
  if @names.has_key?(@name.to_sym)
    @user_profile = @names[@name.to_sym]
  else
    redirect '/'
  end

  erb :user
end

not_found do
  redirect '/'
end

helpers do
  def count_users
    num_of_users = @names.keys.size
  end

  def count_interests
    counter = 0
    @names.each do |user|
       counter += @names[user[0].to_sym][:interests].size
    end
    counter
  end

end

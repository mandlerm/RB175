require "sinatra"
require "sinatra/reloader"
require 'yaml'
require 'pry'


get "/" do
  @names = YAML.load_file("./users.yaml").keys

  erb :names

end

get "/:user" do
  @name = params[:user]

  erb :user

end

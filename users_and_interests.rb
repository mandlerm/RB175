require "sinatra"
require "sinatra/reloader"
require 'yaml'
require 'pry'

before do
  @names = YAML.load_file("./users.yaml")
end

get "/" do
  @people = @names.keys

  erb :names

end

get "/:user" do
  @name = params[:user]

  erb :user

end

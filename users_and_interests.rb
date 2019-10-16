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
  @user_profile = @names[@name.to_sym] if @names.has_key?(@name.to_sym)

binding.pry
  erb :user

end

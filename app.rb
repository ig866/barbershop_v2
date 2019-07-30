require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do

  @user_name = params[:username]
  @phone = params[:phone]
	@date_time = params[:datetime]
  @barber = params[:barber]
  erb "ok!,#{@user_name},#{@phone},#{@date_time},#{@barber}"
end
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello!"
end

get '/about' do
  @error = 'something wrong!'
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do

  @username = params[:username]
  @phone = params[:phone]
	@date_time = params[:datetime]
  @barber = params[:barber]
  @color = params[:color]

  if @username = ' '
     @error = "Введите имя"
    return erb :visit
  end

  erb "ok!,#{@username},#{@phone},#{@date_time},#{@barber},#{@color}"
end
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
	@datetime = params[:datetime]
  @barber = params[:barber]
  @color = params[:color]

###########################
#хеши ключ /значение
  hh = {:username => 'Введите имя',
      :phone => 'Введите телефон',
      :datetime => 'Введите время посещения'}
  # для каждой пары ключ/значение
 # hh.each do |key, value|
    #если параметр пуст
 # if params[key] == ''
    # переменной эррор присвоить валью из хеша
 # @error = hh[key]
 # return erb :visit
 # end
 # end
#########################
@error = hh.select {|key,_|params[key] == ""}.values.join(",")
  if @error != ''
  return erb :visit
  end

  erb "ok!,#{@username},#{@phone},#{@datetime},#{@barber},#{@color}"
end
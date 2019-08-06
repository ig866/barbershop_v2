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
#########################################################
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

post '/contacts' do
  require "pony"

  #body = "1111111111111#{@username},#{@phone},#{@datetime},#{@barber},#{@color}"

 @barbershop_mail_pass = params[:barbershop_mail_pass]
 @customer_mail = params[:customer_mail]

  ##########################################################
  Pony.mail({

                :subject => "Вы записаны в наш Barbershop",
                :body => 'йобанаврот оно работает',
                :to => @customer_mail,
                :from => 'ihor.boiko1@gmail.com',

                via: :smtp,
                via_options:
                    {
                        domain: 'gmail.com',
                        address: 'smtp.gmail.com',
                        port:  '587',
                        :user_name => 'ihor.boiko1',
                        :password => @barbershop_mail_pass,
                        :authentication => :plain
                    }
            })

  ################################

  h1 ={:customer_mail =>'Введите почту'}

  @error = h1.select {|key,_|params[key] == ""}.values.join(",")

  if @customer_mail == ''
    @error = 'Ошибка: Введите почту!'
    return erb :contacts
  end

  if @error != ''
    return erb :contacts
  end

  erb "ok!,#{@username},#{@phone},#{@datetime},#{@barber},#{@color}"
  erb "ok! мы отправили подтвержение ,#{@customer_mail}"
end
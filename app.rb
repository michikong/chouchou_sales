require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "info.sqlite3"}
enable :sessions

class Info < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :ruby
  validates_presence_of :phone_number
  validates_presence_of :email
  validates_presence_of :age
  validates_presence_of :gender
  validates_presence_of :payment
  validates_presence_of :contact
end

class Inquiry < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :ruby
  validates_presence_of :email
  validates_presence_of :contact
  validates_presence_of :confirm_email1
  validates_presence_of :confirm_email2
end

get '/' do
   # @info = Info.new
   # mysqlに接続
   # host、username、password、データベース名を指定
   # client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'chouchou', encoding: 'utf8')

   # レコードの追加
   # @records = client.query("SELECT * FROM payments ORDER BY created_at DESC")
   erb :index
end


get '/contact' do
   @info = Info.new
   erb :contact
end

get '/company' do
   erb :company
end

get '/address' do
   erb :address
end

post '/info' do

   # name = params[:name]
   # ruby = params[:ruby]
   # age = params[:age]
   # gender = params[:gender]
   # payment = params[:payment]
   # contact = params[:contact]

   @info = Info.new({
      name: params[:name],
      ruby: params[:ruby],
      phone_number: params[:phone_number],
      email: params[:email],
      age: params[:age],
      gender: params[:gender],
      payment: params[:payment],
      contact: params[:contact]}
      )
   #データ保存
   # binding.pry
   if @info.save
      #true
      erb :complete
   else
      #folse
      erb :contact
   end
   # mysqlに接続
   # host、username、password、データベース名を指定
   # client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'chouchou', encoding: 'utf8')

   # parameter = params
   # statement = client.prepare('INSERT INTO payments(name, ruby, age, gender, payment, content) VALUES(?, ?, ?, ?, ?, ?)')
   # statement.execute(params['name'], params['ruby'], params['age'], params['gender'], params['payment'], params['content'])

   # # レコードの追加
   # @records = client.query("SELECT * FROM payments ORDER BY created_at DESC")
   erb :complete


end

get '/inquiry' do
   @inquiry = Inquiry.new
   @message = session.delete :message
   erb :inquiry
end

get '/inquiry_complete' do
   @inquiry = Inquiry.new
   @message = session.delete :message
   erb :inquiry_complete
end

post '/inquiry' do
   
   name = params[:name]
   
   @inquiry = Inquiry.new({
      name: name,
      ruby: params[:ruby],
      email: params[:email],
      contact: params[:contact],
      confirm_email1: params[:confirm_email1],
      confirm_email2: params[:confirm_email2]
   })
   
   if params[:confirm_email1] + '@' + params[:confirm_email2] == params[:email]
      @inquiry.save
      session[:message] = "#{name}さん"
      redirect 'inquiry_complete'
   else
      session[:message] = 'エラーが発生しました。再度入力ください。'
      # erb :inquiry
      redirect '/inquiry'
   end
   # binding.pry

   # redirect '/'
end

get '/blog' do
   erb :blog
end
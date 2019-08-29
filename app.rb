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

class Contact < ActiveRecord::Base
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


get '/payment' do
   @info = Info.new
   erb :payment
end

get '/company' do
   erb :company
end

get '/address' do
   erb :address
end

post '/payment' do

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
      erb :payment_complete
   else
      #folse
      erb :payment
   end
   # mysqlに接続
   # host、username、password、データベース名を指定
   # client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'chouchou', encoding: 'utf8')

   # parameter = params
   # statement = client.prepare('INSERT INTO payments(name, ruby, age, gender, payment, content) VALUES(?, ?, ?, ?, ?, ?)')
   # statement.execute(params['name'], params['ruby'], params['age'], params['gender'], params['payment'], params['content'])

   # # レコードの追加
   # @records = client.query("SELECT * FROM payments ORDER BY created_at DESC")
   # erb :complete
end

get '/contact' do
   @contact = Contact.new
   @message = session.delete :message
   erb :contact
end

post '/contact_complete' do
   @contact = Contact.new
   @message = session.delete :message
   erb :contact_complete
end

post '/contact' do
   
   name = params[:name]
   
   @contact = Contact.new({
      name: name,
      ruby: params[:ruby],
      email: params[:email],
      contact: params[:contact],
      confirm_email1: params[:confirm_email1],
      confirm_email2: params[:confirm_email2]
   })
   
   if params[:confirm_email1] + '@' + params[:confirm_email2] == params[:email]
      @contact.save
      erb :contact_complete
      # session[:message] = "#{name}さん"
      # redirect 'contact_complete'
   else
      # erb :contact
      session[:message] = 'エラーが発生しました。内容を再度ご確認ください。'
      redirect '/contact'
   end
end

get '/blog' do
   erb :blog
end

get '/payment_aggregate_results' do
   erb :payment_aggregate_results
   @info = Info.new
end

get '/contact_all' do
   # @contact = Contact.new
   # binding.pry
   erb :contact_all
end

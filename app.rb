# binding.pry
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

post '/' do
   
   # name = params[:name]
   # ruby = params[:ruby]
   # age = params[:age]
   # gender = params[:gender]
   # payment = params[:payment]
   # contact = params[:contact]
   
   #空箱作成
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
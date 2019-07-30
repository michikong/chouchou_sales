require 'sinatra'
require 'mysql2'
require 'pry'
# binding.pry

get '/' do
   # mysqlに接続
   # host、username、password、データベース名を指定
   client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'chouchou', encoding: 'utf8')
   
   # レコードの追加
   @records = client.query("SELECT * FROM payments ORDER BY created_at DESC")
   erb :contact
end
   
post '/' do
   # mysqlに接続
   # host、username、password、データベース名を指定
   client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'chouchou', encoding: 'utf8')
   
   # parameter = params
   statement = client.prepare('INSERT INTO payments(name, ruby, age, gender, payment, content) VALUES(?, ?, ?, ?, ?, ?)')
   statement.execute(params['name'], params['ruby'], params['age'], params['gender'], params['payment'], params['content'])
   
   # レコードの追加
   @records = client.query("SELECT * FROM payments ORDER BY created_at DESC")
   erb :complete
end
require 'sinatra'
require 'mysql2'

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
   form_typed = params['']
   statement = client.prepare('INSERT INTO payments() VALUES()')
   statement.execute(form_typed)
   
   # レコードの追加
   @records = client.query("SELECT * FROM payments ORDER BY created_at DESC")
   erb :complete
end
require 'sinatra'
require 'mysql2'

get '/' do
   client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'chouchou', encoding: 'utf8')
   @records = client.query("SELECT * FROM payments ORDER BY created_at DESC")
   erb :contact
end

post '/' do
   client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'chouchou', encoding: 'utf8')
   chouchou_name = params['name']
   statement = client.prepare('INSERT INTO payments (name) VALUES(?)')
   statement.execute(chouchou_name)

   @records = client.query("SELECT * FROM payments ORDER BY created_at DESC")
   erb :complete
end
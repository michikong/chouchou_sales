require 'sinatra'

get '/' do
   erb :contact
end

post '/' do
   erb :complete
end
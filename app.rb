require 'sinatra'

get '/' do
   erb :contact
end

get 'post' do
   erb :complete
end
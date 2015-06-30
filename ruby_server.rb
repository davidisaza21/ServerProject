# ruby_server.rb

require 'sinatra'



get '/' do
File.read(File.join('public', 'current_stock_ticker.rb'))
end

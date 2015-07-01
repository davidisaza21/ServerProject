# ruby_server.rb

require 'sinatra'
require 'HTTParty'
require 'nokogiri'


get '/' do
File.read(File.join('public', 'current_stock_ticker.rb'))
end

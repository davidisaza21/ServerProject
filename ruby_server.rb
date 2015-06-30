# ruby_server.rb

require 'sinatra'



get '/' do
File.read(File.join('public', 'Hello world!.txt'))
end

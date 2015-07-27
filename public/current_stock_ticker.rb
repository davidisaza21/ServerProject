# current_stock_ticker.rb

# def put_a_line
#   puts " " * 100
# end

#HTTParty, and Nokogiri gems called
require 'httparty'
require 'nokogiri'
require 'sinatra'

#made connection with the different parts of the web i want to  scrape
apple_site = HTTParty.get('http://finance.yahoo.com/q?s=AAPL&ql=0')
google_site = HTTParty.get('http://finance.yahoo.com/q?s=GOOG')
facebook_site = HTTParty.get('http://finance.yahoo.com/q?s=FB&ql=0')
intel_site = HTTParty.get('http://finance.yahoo.com/q?s=INTC&ql=0')
microsoft_site = HTTParty.get('http://finance.yahoo.com/q?s=MSFT&ql=0')

# p response.headers["Content-Type"]

#used nokogiri gem to find and convert the infomation i am looking for
dom_apple = Nokogiri::HTML(apple_site.body)
dom_goog = Nokogiri::HTML(google_site.body)
dom_facebook = Nokogiri::HTML(facebook_site.body)
dom_intel = Nokogiri::HTML(intel_site)
dom_microsoft = Nokogiri::HTML(microsoft_site)
# p dom.xpath("//*").size
# p dom.xpath("//span").size

#scaped actual information from the section of the page i was looking for
apple = dom_apple.xpath("//span[@id='yfs_l84_aapl']")
google = dom_goog.xpath("//span[@id='yfs_l84_goog']")
facebook = dom_facebook.xpath("//span[@id='yfs_l84_fb']")
intel = dom_intel.xpath("//span[@id='yfs_l84_intc']")
microsoft =dom_microsoft.xpath("//span[@id='yfs_l84_msft']")

#organized my information, and get it ready for output
apple_stock = apple.first
google_stock = google.first
facebook_stock = facebook.first
intel_stock = intel.first
microsoft_stock = microsoft.first

# p'd all my outputs to make sure all my information was scaped correctly
puts apple_stock.text
puts google_stock.text
puts facebook_stock.text
puts intel_stock.text
puts microsoft_stock.text

puts "The current price of AAPL is $#{apple.text}"

display menu with list of the five different stock prices they can look at include only five choices
put_a_line
puts "Welcome to our Nasdaq top five ticker."
put_a_line
puts "You can choose to see the stock for any of todays top five stock."
puts "Stock Options for today:[Apple => AAPL, Google => GOOG, Facebook => FB, Intel => INTC, Microsoft => MSFT]"
put_a_line
stock_option = "aapl"
put_a_line
# ask user for which stock price he is looking for allow for search in both symbol and name
case stock_option
	when "aapl","apple"
		puts "The current price of AAPL is $#{apple.text}"
	when "goog","google"
		puts "The current price of GOOG is $#{google.text}"
	when "fb", "Facebook"
		puts "The current price of FB is $#{facebook.text}"
	when "intc", "intel"
		puts "The current price of INTC is $#{intel.text}"
	when "msft", "microsoft"
		puts "The current price of MSFT is $#{microsoft.text}"
	else
		puts "Looks like that stock didn't make our list for today."
end
put_a_line
puts "Thank you for searching your stock prices with us today!"
# scrap information for all the stock to include stock previous day close change percent change and current price




# ruby_server.rb

require 'sinatra'
require 'httparty'
require 'nokogiri'


get '/' do
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
p "The current price of AAPL is $#{apple.text}"
p "The current price of GOOG is $#{google.text}"
p "The current price of FB is $#{facebook.text}"
p "The current price of INTC is $#{intel.text}"
p "The current price of MSFT is $#{microsoft.text}"

end

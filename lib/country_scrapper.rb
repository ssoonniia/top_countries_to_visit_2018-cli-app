require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.page
     doc = Nokogiri::HTML(open(https://www.lonelyplanet.com/best-in-travel/countries))
  end

end

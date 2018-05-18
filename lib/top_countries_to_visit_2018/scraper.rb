# !/usr/bin/env ruby
require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.get_page
    page = Nokogiri::HTML open("https://www.lonelyplanet.com/best-in-travel/countries")
  end

  def self.list_countries
    doc = self.get_page.css(".marketing-article__header")
      doc.each do |country|
        puts country.search("h1").text
      end
  end

  def self.travel_information
    all_info = self.get_page.css(".marketing-article__content")
    info_array = all_info.collect do |info|
      info.text.gsub(/^\s*/,'')
    end
    info_array
  end

end

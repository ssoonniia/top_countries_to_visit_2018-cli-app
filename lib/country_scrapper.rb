#!/usr/bin/env ruby
require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
# to be removed - for IRB testing only
  def initialize
  end

  def get_page
    page = Nokogiri::HTML open("https://www.lonelyplanet.com/best-in-travel/countries")
  end

  def list_countries
    doc = self.get_page.css(".marketing-article__header")
      doc.each do |country|
        puts country.search("h1").text
      end
  end

  def travel_information
    all_info = self.get_page.css(".marketing-article__content")
    info_array = all_info.collect do |info|
      info.text
    end
    info_array
  end


end

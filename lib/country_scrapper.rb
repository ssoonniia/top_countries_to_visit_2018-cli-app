#!/usr/bin/env ruby
require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper


   def get_page
      doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries")
      doc
    end

    def countries
      countries = self.get_page.css("marketing_article_header").css("h1")
      countries.each_with_index |country, index|
        puts "#{index+1}. country"
      end 
  end


end

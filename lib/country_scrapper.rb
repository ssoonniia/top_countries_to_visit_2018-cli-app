#!/usr/bin/env ruby
require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def initialize
  end

   def get_page
      page = Nokogiri::HTML open("https://www.lonelyplanet.com/best-in-travel/countries")
      doc = page.css(".marketing-article__header")
   # working ! 
      doc.each do |country|
        puts country.search("h1").text
      end

    end

    def countries
      countries = self.get_page.css("marketing_article_header").css("h1")
      countries.each_with_index do |country, index|
        puts "#{index+1}. #{country}"
      end
    end

    def travel_infor

    end


end

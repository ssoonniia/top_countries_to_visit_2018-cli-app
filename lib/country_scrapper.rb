#!/usr/bin/env ruby
require 'open-uri'
require 'pry'
require 'nokogiri'
attr_accessor :input

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
# for testing only - will divide the below into different classes 
  def welcome
    puts "Welcome to top 10 Countries to visit!"
  end

  def start
    puts "Here they are!"
    self.list_countries
    self.get_input
    self.show_information
    self.next
  end

  def get_input
    puts "What number country would you like to see 1-10?"
      input = gets.strip.to_i
      @input = input
  end

  def show_information
    puts self.travel_information[@input-1]
  end

  def next
    puts "What would you like to do next?"
    puts "1. See information about another country?"
    puts "2. See the list of top 10 Countries to visit again?"
    puts "3. Exit?"

    selection = gets.stip.to_i

    if selection == 1
      self.start
    elsif selction == 2
      self.get_input
    else "Bon Voyage!"

  end


end

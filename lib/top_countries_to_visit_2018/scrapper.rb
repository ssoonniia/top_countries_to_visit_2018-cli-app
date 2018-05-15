#!/usr/bin/env ruby
require 'open-uri'
require 'pry'
require 'nokogiri'
attr_accessor :input

# class TopCountriesToVisit2018::Scrapper
class Scraper

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
      info.text.gsub(/^\s*/,'')
    end
    info_array
  end

# for testing only - will divide the below into different CLI classes
  def welcome
    puts ""
    puts "Welcome to top 10 Countries to visit!"
    puts ""
    self.start
  end

  def start
    puts ""
    puts "Here they are!"
    puts ""
    self.list_countries
    self.get_input
    self.show_information
    self.next
  end

  def get_input
    puts ""
    puts "What number country would you like to see 1-10?"
      input = gets.strip.to_i
      @input = input
    puts ""
  end

  def show_information
    puts self.travel_information[@input-1]
  end

  def next
    puts ""
    puts "What would you like to do next?"
    puts "1. See information about another country?"
    puts "2. See the list of top 10 Countries to visit again?"
    puts "3. Or exit?"

    selection = gets.strip.to_i
    if selection == 1
      self.get_input
      self.show_information
      self.next
    elsif selection == 2
      self.start
    elsif selection == 3
      "Bon Voyage!"
    else
      puts "Please select a valid option 1, 2 or 3."
      self.next
    end
  end

  
end

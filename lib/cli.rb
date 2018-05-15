require "pry"
require_relative "../lib/country_scrapper.rb"
require_relative "..lib/cli.rb"

class CLI

  def start
    puts "Welcome to top 10 Countries to visit!"
    puts "Here they are!"
    Scraper.list_countries
  end

  def more_information
    puts "What number country would you like to see 1-10?"
      input = gets.strip.to_i
    end

end

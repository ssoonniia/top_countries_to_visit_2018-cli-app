# require "top_countries_to_visit_2018/version"
# require_relative "../lib/scrapper.rb"
# require_relative "..lib/cli.rb"

Class TopCountriesToVisit2018::CLI
  def welcome
    scraper = TopCountriesToVisit2018::Scraper.new
    puts "Welcome to top 10 Countries to visit!"
    self.start
  end

  def start
    puts "Here they are!"
    scraper.list_countries
    scraper.get_input
    scraper.show_information
    scraper.next
  end

  def get_input
    puts "What number country would you like to see 1-10?"
      input = gets.strip.to_i
      @input = input
  end

  def show_information
    puts TopCountriesToVisit2018::Scraper.travel_information
    puts scraper.travel_information[@input-1]
  end

  def next
    puts "What would you like to do next?"
    puts "1. See information about another country?"
    puts "2. See the list of top 10 Countries to visit again?"
    puts "3. Exit?"

    selection = gets.strip.to_i

    if selection == 1
      scraper.get_input
      scraper.show_information
      scraper.next
    elsif selection == 2
      scraper.start
    else
      "Bon Voyage!"
    end
  end
end

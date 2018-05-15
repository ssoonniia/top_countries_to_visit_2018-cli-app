
require_relative "scraper.rb"


class CLI
  attr_reader :scraper
  attr_accessor :input

  def welcome
    scraper = Scraper.new
    @scraper = scraper
    puts ""
    puts "Welcome to top 10 Countries to visit!"
    puts ""
    self.start
  end

  def start
    puts ""
    puts "Here they are!"
    puts ""
    @scraper.list_countries
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
    puts @scraper.travel_information[@input-1]
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

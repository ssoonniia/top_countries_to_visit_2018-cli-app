class CLI

  attr_accessor :input

  def welcome
    puts ""
    puts "Welcome to top 10 Countries to visit!"
    puts ""
    start
  end

  def start
    puts "Here they are!"
    puts ""
    Scraper.list_countries
    get_input
    show_information
    next_options
  end

  def get_input
    puts ""
    puts "What number country would you like to see 1-10?"
      @input = gets.strip.to_i
    puts ""
  end

  def show_information
    puts Scraper.travel_information[@input-1]
  end

  def next_options
    puts ""
    puts "What would you like to do next?"
    puts "1. See information about another country?"
    puts "2. See the list of top 10 Countries to visit again?"
    puts "3. Or exit?"

    @input = gets.strip.to_i
    if @input == 1
      get_input
      show_information
      next_options
    elsif @input == 2
      start
    elsif @input == 3
      puts "Bon Voyage!"
    else
      puts "Please select a valid option 1, 2 or 3."
      next_options
    end
  end

end

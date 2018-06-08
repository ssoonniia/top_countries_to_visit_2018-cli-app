class CLI

  attr_accessor :input

  def welcome
    Scraper.create_countries
    puts ""
    puts "Welcome to top 10 Countries to visit!"
    start
  end

  def start
    puts ""
    puts "Here they are!"
    puts ""
    Scraper.list_countries
    get_input
  end

  def get_input
    puts ""
    puts "What number country would you like to see 1-10?"
    puts ""
    @input = gets.strip.to_i
      if @input <= Country.all.size
        show_information
      else
        puts "Please make a valid selection"
        get_input
      end
  end

  def show_information
    puts ""
    puts Scraper.travel_information(@input-1)
    next_options
  end

  def next_options
    puts ""
    puts "What would you like to do next?"
    puts "1. See information about another country?"
    puts "2. See the list of top 10 Countries to visit again?"
    puts "3. Or exit?"
    puts ""

    @input = gets.strip.to_i
      if @input == 1
        get_input
        show_information
        next_options
      elsif @input == 2
        start
      elsif @input == 3
        puts ""
        puts "Bon Voyage!"
      else
        puts ""
        puts "Please select a valid option 1, 2 or 3."
        next_options
      end
  end

end

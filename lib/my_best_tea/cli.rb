require_relative "tea"
require_relative "scraper"

class CLI

  attr_accessor :input

  def call
    puts ""
    puts "Welcome to My Best Tea!"
    puts ""
    start
  end

  def start
    list_tea
    Scraper.create_tea_from_url
    print_tea
    goodbye
  end

  def list_tea
    puts ""
    puts "Here are delicious teas that can be found around the world:"
    puts ""
    Scraper.scrape_from_index_page
    Tea.all.each do |tea|
      puts tea.name
    end
  end

  def print_tea
    puts ""
    puts "Please choose a tea to explore or type exit to leave the program"
    puts ""
    while input != "exit"
      input = gets.strip.downcase
      case input
        when "tea 1"
          puts ""
          puts "more information about tea 1"
        when "tea 2"
          puts ""
          puts "more information on tea 2"
        when "tea 3"
          puts ""
          puts "more information on tea 3"
      end
    end
  end

  def goodbye
    puts "Thanks for using My Best Tea -- Happy Sipping!"
  end

end

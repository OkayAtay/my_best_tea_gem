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
    input = nil
    print_tea(input)
    goodbye
  end

  def list_tea
    Scraper.scrape_from_index_page
    puts ""
    puts "Here are delicious teas that can be found around the world:"
    puts ""
    Tea.all.each do |tea|
      puts tea.name
    end
  end

  def print_tea(input)
    puts ""
    puts "Please choose a tea to explore or type exit to leave the program"
    puts ""
    Tea.set_attributes
    input = gets.strip.downcase
    while input != "exit"
      #binding.pry
      Tea.all.each do |t|
        if t.name == input
          puts "Name: #{t.name}"
          puts ""
          puts "Description: #{t.description}"
          puts ""
          puts "Preparation: #{t.preparation}"
          puts ""
          puts "Subtypes: #{t.subtypes}"
          puts ""
        end
      end
      print_tea(input)
    end
  end

  def goodbye
    puts "Thanks for using My Best Tea -- Happy Sipping!"
  end

end

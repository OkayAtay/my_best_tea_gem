require_relative "tea"
require_relative "scraper"

class CLI

  attr_accessor :input

  def call
    Scraper.scrape_from_index_page
    puts ""
    puts "Welcome to My Best Tea!"
    puts ""
    Tea.set_attributes
    start
  end

  def start
    list_tea
    input = nil
    input = gets.strip.downcase
    if input != 'exit'
      print_tea(input)
      start
    end
    goodbye
  end

  def list_tea
    puts ""
    puts "Here are delicious teas that can be found around the world:"
    puts ""
    Tea.all.each do |tea|
      puts tea.name
    end
    puts ""
    puts "Please choose a tea to explore or type exit to leave the program"
    puts ""
  end

  def print_tea(input)
      Tea.all.each do |t|
        if t.name == input
          puts ""
          puts "Learn more about #{t.name} tea below!"
          puts ""
          puts "Description: \n #{t.description}"
          puts ""
          puts "Preparation: \n #{t.preparation}"
          puts ""
          puts "Subtypes: \n #{t.subtypes}"
          puts ""
        end
      end
    end

  def goodbye
    puts "Thanks for using My Best Tea -- Happy Sipping!"
  end

end

require 'pry'
require 'open-uri'
require 'net/http'

class Tea

attr_accessor :name, :url, :description, :preparation, :subtypes
@@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.print_tea(tea)
    binding.pry
    puts tea.name
    puts tea.description
    puts tea.preparation
    puts tea.subtypes
  end

  def self.all
    @@all
  end

end

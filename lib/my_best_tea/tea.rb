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

  def self.set_attributes
    Scraper.create_tea_from_url
  end

  def self.all
    @@all
  end

end

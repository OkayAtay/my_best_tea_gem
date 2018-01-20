require 'pry'
require 'open-uri'
require 'net/http'

class Tea

attr_accessor :name, :url, :description, :preparation, :subtypes
@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end

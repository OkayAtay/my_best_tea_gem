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

  def self.create_from_collection(tea_array)

  end

  def self.add_tea_attributes(tea_attributes_hash)
    tea_attributes_hash.each do |attribute, value|
      self.send(attribute,value)
    end
  end

  def self.all
    @@all
  end

end

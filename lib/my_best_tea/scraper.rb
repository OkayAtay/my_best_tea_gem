require_relative "../my_best_tea/tea.rb"
require 'pry'
require 'nokogiri'

class Scraper

attr_accessor :name, :description, :preparation, :subtypes

  def self.scrape_from_index_page
    tea_list = []
    doc = Nokogiri::HTML(open('https://www.mightyleaf.com/tea-knowledge/types-of-tea'))
    tea_list = doc.search(".row .col-4 h3").text.downcase.split(' tea')
    tea_list.each do |tea|
      Tea.new(tea)
    end
  end

  def self.create_from_index_page(teas)
    teas.each do |tea| Tea.new(tea) end
  end
end

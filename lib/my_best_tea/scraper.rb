require_relative "../my_best_tea/tea.rb"
require 'pry'
require 'nokogiri'

class Scraper

attr_accessor :name, :url, :description, :preparation, :subtypes


  def self.scrape_from_index_page
    tea_list = []
    doc = Nokogiri::HTML(open('https://www.mightyleaf.com/tea-knowledge/types-of-tea'))
    tea_list = doc.search(".row .col-4 h3").text.downcase.split(' tea')
    tea = {}
    tea_list.each do |tea|
      url = doc.search(".row .col-4 a").attribute("href").value
      Tea.new(tea, url)
    end
  end

  def self.scrape_tea_page
    tea_page = Nokogiri::HTML(open('https://www.mightyleaf.com/tea-knowledge/types-of-tea/black-tea'))

      tea_description = tea_page.css(".col-main .std p")[0].text + tea_page.css(".col-main .std p")[1].text
      tea_preparartion = tea_page.css(".col-main .std p")[2].text + tea_page.css(".col-main .std ul").text
    binding.pry
    #.col-main .std p.first
  end


end

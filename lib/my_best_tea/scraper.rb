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
    binding.pry
    end
  end

  def self.create_tea_from_url
    Tea.all.each do |tea|
      tea_page = Nokogiri::HTML(open(tea.url))
        tea.description = tea_page.css(".col-main .std p")[0..1].text,
        tea.preparation = tea_page.css(".col-main .std p")[2].text + tea_page.css(".col-main .std ul").text,
        tea.subtypes = tea_page.css(".col-main .std p")[5..9].text
    end
  end

end

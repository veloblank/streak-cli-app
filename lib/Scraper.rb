require_relative './Prop.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  attr_reader :date

  def get_page (day = date)
    doc = Nokogiri::HTML(open(ESPN))
  end

  def date #returns: "Thu Jun. 29"
    @date = @@doc.css("li.date.active span").first.text
  end
binding.pry
end



















































binding.pry
end

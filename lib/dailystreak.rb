require 'pry'
class DailyStreak
  #has a date/day of week, has an array of many props, not responsible for scraping
  attr_accessor :day, :props

  @prop_date = DateTime.now.strftime "%Y%m%d"
  @alt_date = @@doc.css("li.date.active span").first.text

  def initialize(day)
    @day = day
    @props = [] #array or hash? probably array of props. props might be hashes.
  end

  def prop_builder







  end



























end

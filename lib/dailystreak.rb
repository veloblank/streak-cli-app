require 'pry'
class DailyStreak
  #has a date/day of week, has an array of many props, not responsible for scraping
  attr_accessor :day, :props
  def initialize(day)
    @day = day
    @props = [] #array or hash? probably array of props. props might be hashes.
  end


end

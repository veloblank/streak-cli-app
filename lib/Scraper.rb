require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :day

  def initialize(day)
    @day = day
    @@doc = Nokogiri::HTML(open("https://streak.espn.go."))
    binding.pry
  end

  def all_prop_titles#ordered by start time
    @all_prop_titles = []
    @@doc.css("div.matchup-container strong")[0]


  end #method is not passing in data. will come back

  def number_of_props
    @@doc.css("div.matchup-container").size
  end








  def name_of_sport
    @@doc.css("div.sport-description")[index].text
  end

  def start_time
    @@doc.css("div.matchupDate")[index].text
  end

  def away_team_name
    @@doc.css("div #games-content tr td span strong")[index].text
  end

  def home_team_name
    @@doc.css("div #games-content tr td span strong")[index].text
  end

  def preview_link
    @@doc.css("div.matchupStatus a").attr("href").value
  end

  def select_away_team
    @@doc.css("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").attr("href").value
  end

  def select_home_team
    @@doc.css("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").attr("href").value
  end

  def total_props  #returns: "(20 Total)"
    @@doc.css("span.date-matchup-count")[0].text
  end

  def current_date #returns: "Thu Jun. 29"
    @@doc.css("li.date.active span")[0].text
  end
binding.pry
end

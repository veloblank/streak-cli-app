require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :day
  @@doc = Nokogiri::HTML(open("http://streak.espn.com/en/"))

  def initialize(day)
    @day = day
    @all_prop_titles = []
    @days_sports = []
  end

  def all_prop_titles #will order by start time d/t top-down scrape on site
    @@doc.css("div.matchup-container div.gamequestion strong").each do |title|
      @all_prop_titles << title.text
    end
  end

  def number_of_props
    @@doc.css("div.matchup-container").size
  end

  def name_of_sports
    @@doc.css("div.sport-description").each do |sport|
      @days_sports << sport.text
    end # was not getting all sports for props, but checked site and some swimming events did
        # not have 'swimming' listed as the sport. Considering adding 'nil' or 'adhoc', etc, when prop
        # does not have a sport.
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

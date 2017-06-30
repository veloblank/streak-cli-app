require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  attr_accessor :day
  @@doc = Nokogiri::HTML(open(ESPN))

  def initialize(day)
    @day = day
    @all_prop_titles = []
    @days_sports = []
    @start_times = []
    @away_teams = []
    @home_teams = []
    @preview_links = []
    @current_date = []
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
    end
  end

  def start_time
    @@doc.css("div.matchupDate").each do |time|
      @start_times << time.text
    end
  end

  def away_team_name
    @@doc.css("div #games-content tr td span strong").each do |away_team|
      @away_teams << away_team.text
    end
  end

  def home_team_name
    @@doc.css("div #games-content tr td span strong").each do |home_team|
      @home_teams << home_team.text
    end
  end

  def preview_link
    @@doc.css("div.matchupStatus a").each do |preview_link|
      @preview_links << preview_link.attr("href").value
    end
  end

  def select_away_team
    @@doc.css("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").each do |away_link|
      partial_link = away_link.attr("href").value
      full_link = ESPN + partial_link
      #http://streak.espn.com/en/createOrUpdateEntry?matchup=m60069o60967
    end
  end

  def select_home_team
    @@doc.css("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").attr("href").value
  end

  def total_props  #returns: "(20 Total)". Kind of redundant method and it is string output.
    @@doc.css("span.date-matchup-count").first.text
  end

  def current_date #returns: "Thu Jun. 29"
    @current_date= @@doc.css("li.date.active span").first.text
  end
binding.pry
end

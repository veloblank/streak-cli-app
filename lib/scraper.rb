require 'nokogiri'
require 'open-uri'
require 'time'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@scraped_props = []
  @@team_urls = []
  @@away_team_urls = []
  @@home_team_urls = []

  def self.get_page
    @doc = Nokogiri::HTML(open(ESPN))
    @prop_num = @doc.css("div.matchupDate").size
  end

  def self.get_teams
    @away_teams = []
    @home_teams = []
    @doc.css("div #games-content tr td.mg-column3.opponents").each_with_index do |team, index|
      index.even? ? @away_teams.push(team.text) : @home_teams.push(team.text)
    end
  end

  def self.scrape_team_urls
    team_urls = []
      if @doc.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").size/2 == @@scraped_props.size
        @doc.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").each_with_index do |team, index|
          team_url = ESPN + "#{team.attr("href")}"
          team_urls << team_url
        end
      else
        team_urls = Array.new(@prop_num, "http://blank.org")
      end
    @@team_urls = team_urls.partition.with_index{|url, i| i.even?}
    @@away_team_urls = @@team_urls[0]
    @@home_team_urls = @@team_urls[1]
  end

  def self.build_props
    get_teams
    @doc.css("div.matchup-container div.gamequestion strong").each_with_index do |event, index|
      event = event.text
      start = Time.parse(@doc.css("div.matchupDate")[index].text)
      sport = @doc.css("div.sport-description")[index].text
      prop_preview = @doc.css("div.matchupStatus a")[index].attr("href")
      prop = {
        event_title: event,
        start_time: start.strftime("%H:%M"),
        sport: sport,
        prop_preview: prop_preview,
        away_team: @away_teams[index],
        home_team: @home_teams[index],
        away_team_url: @@away_team_urls[index],
        home_team_url: @@home_team_urls[index]
        }
        @@scraped_props << prop
    end
  end

  def self.all_props
    @@scraped_props
  end

  def self.home_team_urls
    @@home_team_urls
  end

  def self.away_team_urls
    @@away_team_urls
  end
end

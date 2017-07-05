require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@scraped_props = []
  @@team_urls = []

  def self.scrape_site
    @doc = Nokogiri::HTML(open(ESPN))
    prop_num = @doc.css("div.matchupDate").size
    away_teams = []
    home_teams = []

    @doc.css("div #games-content tr td.mg-column3.opponents").each_with_index do |x, i|
      team_url = ESPN + "#{@doc.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[i].attr("href")}"
      if i.even?
        away_teams.push [x.text, team_url]
      else
        home_teams.push [x.text, team_url]
      end
    end

    i = 0
    while i < prop_num
      event = @doc.css("div.matchup-container div.gamequestion strong")[i].text
      start = @doc.css("div.matchupDate")[i].text
      sport = @doc.css("div.sport-description")[i].text
      prop_preview = @doc.css("div.matchupStatus a")[i].attr("href")
      prop = [
        event_title: event,
        start_time: start,
        sport: sport,
        away_team: away_teams[i],
        home_team: home_teams[i],
        prop_preview: prop_preview
      ]
        @@scraped_props << prop
    i+=1
    end
  end

  def self.scraped_props
    @@scraped_props
  end
  binding.pry
end








#home_or_away =  @doc.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[index].attr("selectionid").split("").last.to_i

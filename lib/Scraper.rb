require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@scraped_props = []

  def self.scrape_site
    away_teams = []
    home_teams = []
    formatted_date  = DateTime.now.strftime "%Y%m%d"
    @doc = Nokogiri::HTML(open(ESPN))
    prop_num = @doc.css("div.matchupDate").size
    @doc.css("div #games-content tr td.mg-column3.opponents").each_with_index do |x, i|
      if i.even?
        away_teams.push [x.text]
      else
        home_teams.push [x.text]
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

#contains both home and away selection_urls
@doc.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[index].attr("href")
 #=> "createOrUpdateEntry?matchup=m60175o61055&date=20170705"

 @doc.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[index].attr("selectionid")
#=> "m60175o61055"

#away_team
@doc.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[1].attr("selectionid").split("").last.to_i.even?
#=> false

#home_team
@doc.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[1].attr("selectionid").split("").last.to_i.even?
#=> true

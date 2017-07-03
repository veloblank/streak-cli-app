require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@props = []

  def self.scrape
    away_teams = []
    home_teams = []
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
        @@props << prop
    i+=1
    end
  end
binding.pry
end

#Had a continuous off by one error, and found it was a bad html line. The away team HTML
#returned ALL the contestants of ALL the props, not just the away teams. And the home team css
#returned just the home. I recorded a video describing this fix. And I coded a work-around.
#I dare say I'm done with the scraper. At least it gets me the information I minimally need.

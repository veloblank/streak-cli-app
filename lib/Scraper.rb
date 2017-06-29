require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  @@doc = []

  attr_accessor :day
  def initialize(day)
    #would like to have variable @dailystreak = DailyStreak.new(day)
    @day = day


  end

  def initial_scrape
    @@doc = Nokogiri::HTML(open("http://streak.espn.go.com"))

  end

binding.pry
end


#all_props: div class="matchup-container"

#event_title: ("div.matchup-container")[index].text
#name_of_sport: ("div.sport-description")[index].text
#start_time: ("div.matchupDate")[index].text
#away_team: ("div #games-content tr td span strong")[index].text
#home_team: ("div #games-content tr td span strong")[index].text

#preview_link/matchup-status: ("div.matchupStatus a").attr("href").value

#address = http://streak.espn.com/en/createOrUpdateEntry?matchup=
#pick_away_team: "address" + "=m60022o60930&date=20170628"
    #buried in a#matchupDiv and then has unique URL
#pick_home_team: "address" + "=m60022o60931&date=20170628"
    #buried in a#matchupDiv and then has unique URL
#total props: li.date.active span.date-matchup-count .text
#current date: li.date.active span .text
    #Scraping the Away or Home team seems difficult on the surface. The href is
    #chopped up into several different pieces.

    #Obtaining each URL is as easy as right clicking and "Copy Link Address".
    #The user could pass these in manually with an import method of CSV...
    #A method could easily attach these to the proper objects then, by index number,
    #provided no props are added or deleted from the website.

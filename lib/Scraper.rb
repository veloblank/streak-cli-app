require 'pry'
class Scraper
  attr_accessor :day
  def initialize(day)
    #would like to have variable @dailystreak = DailyStreak.new(day)


  end





binding.pry
end


#all_props: div class="matchup-container"

#event_title: div class="gamequestion" .text
#sport: div class="sport-description" .text
#start_time: div class="matchupDate span class="startTime" .text
#away_team: #buried with an href .text
#home_team: #buried with an href .text
#skipping result:
#preview_link/matchup-status: div class="matchupStatus" a .text

#address = http://streak.espn.com/en/createOrUpdateEntry?matchup=
#pick_away_team: "address" + "=m60022o60930&date=20170628"
    #buried in a#matchupDiv and then has unique URL
#pick_home_team: "address" + "=m60022o60931&date=20170628"
    #buried in a#matchupDiv and then has unique URL

    #Scraping the Away or Home team seems difficult on the surface. The href is
    #chopped up into several different pieces.

    #Obtaining each URL is as easy as right clicking and "Copy Link Address".
    #The user could pass these in manually with an import method of CSV...
    #A method could easily attach these to the proper objects then, by index number,
    #provided no props are added or deleted from the website.

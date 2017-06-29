require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  @@doc = []
  #@@all = [] #don't really need this currently. maybe as future project

  attr_accessor :day
  def initialize(day)
    @day = day
    @@doc = Nokogiri::HTML(open("http://streak.espn.go.com"))
    #@@all << self
  end
end


#all_props: div class="matchup-container"

#event_title: ("div.matchup-container")[index].text
#name_of_sport: ("div.sport-description")[index].text
#start_time: ("div.matchupDate")[index].text
#away_team: ("div #games-content tr td span strong")[index].text
#home_team: ("div #games-content tr td span strong")[index].text

#preview_link/matchup-status: ("div.matchupStatus a").attr("href")[index].value

#address = http://streak.espn.com/en/  +  ----> the css return will be full link
#pick_away_team: ("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").attr("href")[index].value
#pick_home_team: ("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").attr("href")[index].value

#total props: ("span.date-matchup-count").first.text  ----> returns: "(20 Total)"

#current date: ("li.date.active span").first.text  ----> returns: "Thu Jun. 29"

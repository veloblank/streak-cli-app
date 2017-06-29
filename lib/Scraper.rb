require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  @@doc = []

  def initialize
    @@doc = Nokogiri::HTML(open("http://streak.espn.go.com"))
  end

  def all_props #ordered by start time
    @all_prop_titles = []
    prop_title = @@doc.css("div.matchup-container strong")
    prop_title.each_index {|x| @all_prop_titles << prop_title[x].text}
  end

  def number_of_props
    @@doc.css("div.matchup-container").size
  end






binding.pry
end

#number_of_props: ("div.matchup-container").size
#all_prop_titles: ("div.matchup-container strong")

#event_title: ("div.matchup-container strong").first.text
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

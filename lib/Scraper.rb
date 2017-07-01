require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@doc = Nokogiri::HTML(open(ESPN))
  @@prop_array = []
  @@away_team = {}
  @@home_team = {}
  @@start_time = {}

  def self.create_prop_key_array
    num = @@doc.css("div.matchup-container").size
    i = 1
    while i <= num do
      @@prop_array << "Prop_#{i}"
    i+=1
    end
  end #=> "["Prop_1", "Prop_2", "Prop_3"]"

  def prop_creator



  end

  def self.prop_title
    @@doc.css("div.matchup-container div.gamequestion strong")
  end


  def self.name_of_sport  #Some props do not have scrapeable sport names. Could be a problem.
    @@doc.css("div.sport-description")
  end

  def self.start_time
    # @@doc.css("div.matchupDate").each.with_index do |time, index|
    #   @@start_time
  end

  def self.away_team_name
    @@doc.css("div #games-content tr td.mg-column3.opponents").each_with_index do |away_team, i|
      if i.even?
        @@away_team << away_team.text
      end #scraper was getting both teams with this CSS
    end
    return #controls an out of control return value if it ended wrong 'i'
  end

  def self.home_team_name
    @@doc.css("div #games-content tr td.mg-column3.opponents.last").each do |home_team|
      @@home_team << home_team.text
    end
  end

  def self.preview_link
    @@doc.css("div.matchupStatus a").each do |preview_link|
      @preview_links << preview_link.attr("href")
    end
  end
binding.pry
end

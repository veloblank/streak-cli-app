require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@doc = Nokogiri::HTML(open(ESPN))
  @@home_team = {}
  @@start_time = {}
  @@preview_links = []
  @@prop_array = []
  @@props = {}
  
  def self.number_of_props
    @@doc.css("div.matchup-container").size
  end

  def self.create_prop_key_array
    num = @@doc.css("div.matchup-container").size
    i = 1
    while i <= num do
      @@prop_array << "Prop_#{i}"
    i+=1
    end
  end #=> "["Prop_1", "Prop_2", "Prop_3"]"

  def self.prop_creator(self.number_of_props)
    @@prop_array[]
  end

  def self.prop_title
    @@doc.css("div.matchup-container div.gamequestion strong")
  end

  def self.start_time
    @@doc.css("div.matchupDate")
  end

  def self.away_team_name
    @@doc.css("div #games-content tr td.mg-column3.opponents").each_with_index do |away_team, i|
      if i.even?
        @@away_team = Hash.new(away_team.text
      end
    end
  end

  def self.home_team_name
    @@doc.css("div #games-content tr td.mg-column3.opponents.last").each do |home_team|
      @@home_team << home_team.text
    end
  end

  def self.preview_link
    @@doc.css("div.matchupStatus a")
  end

  def self.name_of_sport  #Some props do not have scrapeable sport names. Could be a problem.
    @@doc.css("div.sport-description")
  end





binding.pry
end

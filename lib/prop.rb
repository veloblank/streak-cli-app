require 'pry'

class Prop
  @@all = []
  @@props = []

  attr_accessor :prop_id_num, :event_title, :start_time, :sport, :away_team, :home_team, :prop_preview, :away_team_url, :home_team_url

  def initialize(prop)

  end

  def self.get_props
    @@all = []
    all_props = Scraper.get_page
    all_props.each do |prop|
      @@all << prop
    end
    @@all.size
  end

  def self.build_props
    @@all.each.with_index(1) do |p, index|
      prop = {
       prop_id_num: index,
       event_title: p.css(".gamequestion").text,
       start_time: p.css("div .startTime").text,
       sport: p.css(".sport-description").text,
       away_team: p.css("td span")[2].text,
       home_team: p.css("td span")[5].text,
       prop_preview: p.css("div.matchupStatus a").attr("href").value,
       away_team_url: "http://streak.espn.com/en/" + p.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[0].attr("href"),
       home_team_url: "http://streak.espn.com/en/" + p.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[1].attr("href")
     }
     @@props << prop
    end
    binding.pry

  end

  def self.all
    @@all
  end
end

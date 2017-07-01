require 'pry'

class Prop
  attr_accessor :title, :time, :sport, :away_team, :home_team, :preview_link, :away_team_url, :home_team_url
  @@all = []

  def initialize(array)
    @title = title
    @time = time
    @sport = sport
    @away_team = away_team
    @home_team = home_team
    @preview_link = preview_link
    @away_team_url = away_team_url
    @home_team_url = home_team_url
    @@all << self
  end

  def self.all
    @@all
  end

  def

  end








binding.pry
end

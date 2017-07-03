require 'pry'

class Prop

  attr_accessor :title, :time, :sport, :away_team, :home_team, :preview_link
  @@all = []

  def initialize(title=nil, time=nil, sport=nil, away_team=nil, home_team=nil, preview_link=nil )
    @title = title
    @time = time
    @sport = sport
    @away_team = away_team
    @home_team = home_team
    @preview_link = preview_link
    @@all << self
  end

  def self.all
    @@all
  end


  def

  end








binding.pry
end

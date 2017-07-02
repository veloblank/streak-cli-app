require 'pry'

class Prop
  attr_accessor :title, :time, :sport, :away_team, :home_team, :preview_link
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

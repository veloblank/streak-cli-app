require 'pry'

class Prop
  #has many attributes: sport, event_title, start_time, opponents(home/away team), preview_link, check-box-url
  @@all = []
  attr_accessor :sport, :event_title, :start_time, :home_team, :away_team, :preview_link
  def initialize(sport, event_title, start_time, home_team, away_team, preview_link)
    @sport = sport
    @event_title = event_title
    @start_time = start_time
    @home_team = home_team
    @away_team = away_team
    @preview_link = preview_link
  end




binding.pry
end

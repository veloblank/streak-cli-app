require_relative '..config'
require 'pry'
require 'date'


class Prop
  @prop_date = DateTime.now.strftime "%Y%m%d"

  def initialize(day = current_date)
    @day = day
    @all_prop_titles = []
    @number_of_props = nil
    @days_sports = []
    @start_times = []
    @away_teams = []
    @home_teams = []
    @preview_links = []
    @current_date = nil
    @select_away_teams_urls  #this for testing
    @select_home_teams_urls  #this for testing
  end









binding.pry
end

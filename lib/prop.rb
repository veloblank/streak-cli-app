require 'pry'

class Prop
  @@scraped_prop_data = []
  @@props = []

  attr_accessor :prop_id_num, :event_title, :start_time, :sport, :away_team, :home_team, :prop_preview, :away_team_url, :home_team_url, :matchup_status

  def initialize(hash)
    @prop_id_num = hash[:prop_id_num]
    @event_title = hash[:event_title]
    @start_time = hash[:start_time]
    @sport = hash[:sport]
    @away_team = hash[:away_team]
    @home_team = hash[:home_team]
    @prop_preview = hash[:prop_preview]
    @away_team_url = hash[:away_team_url]
    @home_team_url = hash[:home_team_url]
    @matchup_status = hash[:matchup_status]
    @@props << self
  end

  def self.build_props
    Scraper.all_props.each do |prop_hash|
      Prop.new(prop_hash)
    end
  end

  def self.all_props
    @@props
  end
end

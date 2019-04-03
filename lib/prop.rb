class Prop
  @@props = []

  attr_accessor :prop_id, :title,
                :start, :sport,
                :away, :home,
                :prop_preview,
                :away_team_url, :home_team_url,
                :matchup_status, :automate_pick_time

  def save
    @@props << self
  end

  def self.props_by_sport(sport)
    @@props.select {|prop| prop.sport == sport}
  end

  def self.all_props
    @@props
  end
end

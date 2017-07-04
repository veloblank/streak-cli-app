require 'pry'

class Prop
  @@all = []

  attr_accessor :event_title, :start_time, :sport, :away_team, :home_team, :prop_preview

  def initialize(daily_props)
    daily_props.each do |attribute, value|
      self.send("#{attribute}=", "#{value}")
    end
    @@all << self
  end

  def generate_props_from_hash(props_hash)

    
    prop = Prop.new(rops)
  end

  def prop



  def self.all
    @@all
  end

binding.pry
end

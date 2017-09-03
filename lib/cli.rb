require 'pry'
require 'colorize'
require 'time'
require 'launchy'

class Cli
  @@all = []
  @@user_selections = []

  def run
    Scraper.get_page
    Scraper.scrape_team_urls
    Scraper.build_props
    props_hash = Scraper.all_props
    Prop.generate_props_by_hash(props_hash)
    self.welcome
    user_selects_winner
  end

  def welcome
    puts "----------------------------------------------".colorize(:green)
    puts "     Welcome to the DailyStreak Front Page".colorize(:green)
    puts "----------------------------------------------".colorize(:green)
    puts "Here are the Streak props for today..."
    puts ""
    puts ""
    self.print_props
    puts
  end

  def print_props
    @@all = Prop.all.each.with_index(1) do |prop, index|
        puts "#{prop.event_title}".colorize(:red)
        puts "#{index}. ".colorize(:green) + "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "#{prop.home_team}"
        puts ""
    end
  end

  def user_selects_winner
    puts "Choose a prop or type 'exit':"
    user_prop_choice = gets.strip
    if user_prop_choice == "exit"
      exit
    elsif user_prop_choice.to_i.between?(1, @@all.size) == false
      self.user_selects_winner
    else
      user_prop_choice = user_prop_choice.to_i
    end

    user_selection = Prop.all[user_prop_choice - 1]
    puts "#{user_selection.event_title}".colorize(:red)
    puts "#{user_prop_choice}. ".colorize(:green) + "#{user_selection.start_time}   " + "#{user_selection.sport}"
    puts "1. Make insta-online Away selection: " + "#{user_selection.away_team}"
    puts "2. Make insta-online Home selection: " + "#{user_selection.home_team}"
    puts "3. Read online about matchup: "
    puts ""
    # puts "4. Store Away selection in Pick List:"
    # puts "5. Store Home selection in Pick List:"
    # puts ""

    input = ""
    while input != 'back'
      puts "Make selection or type 'back': "
      input = gets.chomp
      case input
      when "1"
        Launchy.open("#{user_selection.away_team_url}")
      when "2"
        Launchy.open("#{user_selection.home_team_url}")
      when "3"
        Launchy.open("#{user_selection.prop_preview}")
      # when "4"
      #   @@user_selections << [user_selection.start_time, user_selection.away_team, user_selection.away_team_url]
      #   @@all = []
      #   run
      # when "5"
      #   @@user_selections << [user_selection.start_time, user_selection.home_team, user_selection.home_team_url]
      #   @@all = []
      #   run
      when "back"
        run
      else
        run
      end
    end
  end
end

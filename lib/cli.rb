require 'pry'
require 'colorize'
require 'time'
require 'launchy'

class Cli
  @@user_selections = []

  def run
    Scraper.scrape_page
    Scraper.scrape_props
    Prop.build_props
    self.welcome
    self.print_props
    self.menu
  end

  def welcome
    puts "----------------------------------------------".colorize(:green)
    puts "     Welcome to the DailyStreak Front Page".colorize(:green)
    puts "----------------------------------------------".colorize(:green)
    puts "Here are the Streak props for today..."
    puts ""
    puts ""
    puts
  end

  def print_props
    Prop.all_props.each do |prop|
      puts "#{prop.event_title}".colorize(:red)
      puts "#{prop.prop_id_num}. ".colorize(:green) + "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "   #{prop.home_team}"
      puts ""
    end
  end

  def menu
    puts "Type 'exit' or choose a prop you want to see more about:"
    input = gets.strip.downcase
    menu if input.to_i > Prop.all_props.size
    case input
    when "exit"
      exit
    else
      input = input.to_i
      prop = Prop.all_props.slice(input-1)
      puts ""
      puts "More info on:"
      puts "#{prop.event_title}".colorize(:red)
      puts "#{prop.prop_id_num}. ".colorize(:green) + "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "   #{prop.home_team}"
      puts prop.matchup_status.colorize(:red)
      puts ""
      puts "1. Read Matchup Preview/Check Score"
      puts "2. Insta-pick Away Team"
      puts "3. Insta-pick Home Team"
      puts "4. Save Away Team in List"
      puts "5. Save Home Team in List"
      puts "6. Back"
      puts ""
    end
  end

  def user_selections
    @@user_selections.each do |prop|
      puts "#{prop.event_title}".colorize(:red)
      puts "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "   #{prop.home_team}"
      puts ""
      puts ""
    end
  end
end

#
# def user_selects_winner
#     puts "Choose a prop or type 'exit':"
#     user_prop_choice = gets.strip
#     if user_prop_choice == "exit"
#       exit
#     elsif user_prop_choice.to_i.between?(1, @@all.size) == false
#       self.user_selects_winner
#     else
#       user_prop_choice = user_prop_choice.to_i
#     end
#
#     user_selection = Prop.all[user_prop_choice - 1]
#     puts "#{user_selection.event_title}".colorize(:red)
#     puts "#{user_prop_choice}. ".colorize(:green) + "#{user_selection.start_time}   " + "#{user_selection.sport}"
#     puts "1. Make insta-online Away selection: " + "#{user_selection.away_team}"
#     puts "2. Make insta-online Home selection: " + "#{user_selection.home_team}"
#     puts "3. Read online about matchup: "
#     puts ""
#     # puts "4. Store Away selection in Pick List:"
#     # puts "5. Store Home selection in Pick List:"
#     # puts ""
#
#     input = ""
#     while input != 'back'
#       puts "Make selection or type 'back': "
#       input = gets.chomp
#       case input
#       when "1"
#         Launchy.open("#{user_selection.away_team_url}")
#       when "2"
#         Launchy.open("#{user_selection.home_team_url}")
#       when "3"
#         Launchy.open("#{user_selection.prop_preview}")
#       # when "4"
#       #   @@user_selections << [user_selection.start_time, user_selection.away_team, user_selection.away_team_url]
#       #   @@all = []
#       #   run
#       # when "5"
#       #   @@user_selections << [user_selection.start_time, user_selection.home_team, user_selection.home_team_url]
#       #   @@all = []
#       #   run
#       when "back"
#         run
#       else
#         run
#       end
#     end
#   end
# end

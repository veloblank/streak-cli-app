class Cli
  @@user_selections = []

  def run
    #Scraper.scrape_page
    Scraper.scrape_props
    #Prop.build_props
    self.welcome
    self.print_all_props
    self.menu
  end

  def welcome
    puts ""
    puts ""
    puts ""
    puts "----------------------------------------------".colorize(:green)
    puts "     Welcome to the DailyStreak Front Page".colorize(:green)
    puts "----------------------------------------------".colorize(:green)
    puts "Here are the #{Prop.all_props.count} Streak props for today..."
    puts ""
    puts ""
    puts ""
  end

  def print_all_props
    Prop.all_props.each do |prop|
      puts "#{prop.event_title}".colorize(:red)
      puts "#{prop.prop_id_num}. ".colorize(:green) + "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "   #{prop.home_team}"
      puts ""
    end
  end

  def print_prop(prop_array)
    prop_array.each do |prop|
      puts "#{prop.event_title}".colorize(:red)
      puts "#{prop.prop_id_num}. ".colorize(:green) + "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "   #{prop.home_team}"
      puts ""
    end
    menu
  end

  def menu
    input = ""
    puts "Type 'list', 'search by sport', 'exit' or choose a prop you want to see more about:"
    input = gets.strip.downcase
    menu if input.to_i > Prop.all_props.size
    case input
    when "leaderboard"
      leaderboard
    when "exit"
      exit
    when 'list'
      user_selections
    when 'search by sport'
      puts "Input sport: "
      input = gets.strip
      events = Prop.props_by_sport(input)
      puts "==================#{events.length} #{input} Props=================="
      print_prop(events)
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
      puts ""
      puts "2. Insta-pick Away Team: " + "#{prop.away_team}".colorize(:green)
      puts "3. Insta-pick Home Team: " + "#{prop.home_team}".colorize(:green)
      puts ""
      puts "4. Save Away Team in Prop List"
      puts "5. Save Home Team in Prop List"
      puts ""
      prop_menu_input = ""
      while prop_menu_input != 'exit'
        puts "Press Enter to go back or type 'exit': "
        prop_menu_input = gets.chomp
        case prop_menu_input
        when "1"
          Launchy.open("#{prop.prop_preview}")
          run
        when "2"
          Launchy.open("#{prop.away_team_url}")
          run
        when "3"
          Launchy.open("#{prop.home_team_url}")
          run
        when "4"
          puts "Choose time (hhmmss) to make pick:"
          choose_time = gets.strip
          user_prop_choice = {
            prop_id_num: prop.prop_id_num,
            event_title: prop.event_title,
            start_time:  prop.start_time,
            sport: prop.sport,
            selection: prop.away_team,
            prop_preview: prop.prop_preview,
            selection_url: prop.away_team_url,
            matchup_status: prop.matchup_status,
            automate_pick_time: choose_time
          }
          @@user_selections << user_prop_choice
          puts "Saved!"
        when "5"
          puts "Choose time (hhmmss) to make pick:"
          choose_time = gets.strip
          user_prop_choice = {
            prop_id_num: prop.prop_id_num,
            event_title: prop.event_title,
            start_time:  prop.start_time,
            sport: prop.sport,
            selection: prop.home_team,
            prop_preview: prop.prop_preview,
            selection_url: prop.home_team_url,
            matchup_status: prop.matchup_status,
            automate_pick_time: choose_time
          }
          @@user_selections << user_prop_choice
          puts "Saved!"
        else
          run
        end
      end
    end
  end

  def leaderboard
    lb_streaks = []
    lb_picks = []
    lb = Scraper.scrape_leaderboard
    i = 2
    until i > 500 do
      streak = lb.css("#leaderboardTable div table tbody tr td")[i].text #.gsub(/[^0-9]/,"").to_i
      picked = lb.css("#leaderboardTable div table tbody tr td")[i + 2].text
      lb_streaks.push(streak)
      lb_picks.push(picked)
      i+=5
    end

    lb_streaks.uniq.each do |x|
      if lb_streaks.count(x) == 1
        puts "#{x} - #{lb_streaks.count(x)} entry"
      else
        puts "#{x} - #{lb_streaks.count(x)} entries"
      end
    end
    menu
  end

  def user_selections
    if @@user_selections.empty? == true
      puts ""
      puts "Your Prop List is empty.".colorize(:red)
      puts ""
      menu
    else
      puts ""
      @@user_selections.each do |pick|
        puts "#{pick[:prop_id_num]}. " + "#{pick[:start_time]} ".colorize(:red) + " #{pick[:selection]}".colorize(:red) + " Pick Time: ".colorize(:yellow) + "#{pick[:automate_pick_time]}".colorize(:yellow)
        puts""
      end
    menu
    end
  end
end

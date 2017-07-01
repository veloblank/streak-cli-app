require 'nokogiri'
require 'open-uri'
require 'pry'
require 'date'

class Scraper
  ESPN = "http://streak.espn.com/en/"

  def initialize(day = current_date)
    doc = Nokogiri::HTML(open(ESPN))
  end

  def all_prop_titles #will order by start time d/t top-down scrape on site
    @@doc.css("div.matchup-container div.gamequestion strong").each do |title|
      @all_prop_titles << title.text
    end
  end

  def number_of_props
    @@doc.css("div.matchup-container").size
  end

  def name_of_sports  #Some props do not have sport names.
    @@doc.css("div.sport-description").each do |sport|
      @days_sports << sport.text
    end
  end

  def start_times
    @@doc.css("div.matchupDate").each do |time|
      @start_times << time.text
    end
  end

  def away_team_names
    @@doc.css("div #games-content tr td.mg-column3.opponents").each_with_index do |away_team, i|
      if i.even?
        @away_teams << away_team.text
      end #scraper was getting both teams with this CSS
    end
    return #controls an out of control return value if it ended wrong 'i'
  end

  def home_team_names
    @@doc.css("div #games-content tr td.mg-column3.opponents.last").each do |home_team|
      @home_teams << home_team.text
    end
  end

  def preview_links
    @@doc.css("div.matchupStatus a").each do |preview_link|
      @preview_links << preview_link.attr("href")
    end
  end

  def current_date #returns: "Thu Jun. 29"
    @current_date= @@doc.css("li.date.active span").first.text
  end

  def select_team_urls #will only work with props not yet started
    @@doc.css("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").each do |team_link|
      partial_link = team_link.attr("href")
      #=> "createOrUpdateEntry?matchup=m60071o60970"
      # It's tough to get away and home teams because of CSS, but I realized the away team has an
      # even integer at the end of partial_link, so a little regex magic gets this:
      full_link = ESPN + partial_link + "&date=" + "@prop_date"
      #http://streak.espn.com/en/createOrUpdateEntry?matchup=m60071o60970&date=20170630
      if partial_link.split(%r{\s*}).last.to_i.even?
        @select_away_teams_urls << full_link
      else
        @select_home_teams_urls << full_link
      end
    end
  end

  def total_props  #returns: "(20 Total)". Kind of redundant method and it is string output.
    @@doc.css("span.date-matchup-count").first.text
  end

binding.pry
end

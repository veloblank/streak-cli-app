require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@prop_hash = {}
  @@prop_key = []

  def self.create_prop_key 
    i = 1
    while i <= 32 do
      @@prop_key << "Prop_#{i}:"
      i+=1
    end
  end #=> "["Prop_1:", "Prop_2:", "Prop_3:"]"

  def self.scrape
    @doc = Nokogiri::HTML(open(ESPN))
    number_of_props = @@doc.css("div.matchup-container").size
    i = 0
    while i < number_of_props do
      @@prop_hash = @@prop_key[i] {
        event_title: @doc.css("div.matchup-container div.gamequestion strong").each {|title| title.text},
        start_time: @doc.css("div.matchupDate").each {|time| time.text},
          if i.even?
            away_team: @doc.css("div #games-content tr td.mg-column3.opponents").each_with_index {|away_team| away_team.text},
          elsif i.odd?
            home_team: @doc.css("div #games-content tr td.mg-column3.opponents.last").each {|home_team| home_team.text},
            prop_preview: @doc.css("div.matchupStatus a").each {|preview_link| preview_link.attr("href")
          end
        team_url = @doc.css("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin").each do |team_link|
        partial_link = team_link.attr("href")
        full_link = ESPN + partial_link + "&date=" + "@prop_date"
          if partial_link.split(%r{\s*}).last.to_i.even?
            away_team_url: team_url
          else
            home_team_url: team_url
          end
        end
      end
    end
end






  # def self.name_of_sport  #Some props do not have scrapeable sport names. Could be a problem.
  #   doc.css("div.sport-description").each do |sport|
  #     type_of_sport = sport.text
  # end

# def current_date #returns: "Thu Jun. 29"
#   @current_date= @@doc.css("li.date.active span").first.text
# end


    #=> "createOrUpdateEntry?matchup=m60071o60970"
    # It's tough to get away and home teams because of CSS, but I realized the away team has an
    # even integer at the end of partial_link, so a little regex magic gets this:
    #http://streak.espn.com/en/createOrUpdateEntry?matchup=m60071o60970&date=20170630

# def total_props  #returns: "(20 Total)". Kind of redundant method and it is string output.
#   @@doc.css("span.date-matchup-count").first.text
# end

require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @prop_hash = {}
  @prop_keys = []

  attr_accessor :number_of_props, :prop_keys

  def initialize(number_of_props)
    @number_of_props = number_of_props
    i = 1
    while i <= number_of_props do
      @prop_keys << "Prop_#{i}:"
      i+=1
    end
  end #=> "["Prop_1:", "Prop_2:", "Prop_3:"]"

  def self.scrape(prop_keys)
    @prop_date = DateTime.now.strftime "%Y%m%d"
    @doc = Nokogiri::HTML(open(ESPN))

    prop_keys.each_with_index do |prop, i|
     if i.even?
       prop = {
         event_title: @doc.css("div.matchup-container div.gamequestion strong")[i].text,
         start_time: @doc.css("div.matchupDate")[i].text},
         prop_preview: @doc.css("div.matchupStatus a")[i].attr("href"),
         away_team: @doc.css("div #games-content tr td.mg-column3.opponents")[i].text},
         home_team: @doc.css("div #games-content tr td.mg-column3.opponents.last")[i].text},
             else
          team_url = @doc.css("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[i] do |team_link|
            partial_url = team_url.attr("href")
            if partial_url.split(%r{\s*}).last.to_i.even?
            full_url = ESPN + partial_url + "&date=" + "@prop_date"
              away_team_url: full_url,
              home_team_url: full_url
#             end
#           }
#       end
#     end

elsif i.odd?

#  def number_of_props
#    number_of_props = @doc.css("div.matchup-container").size
#  end




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

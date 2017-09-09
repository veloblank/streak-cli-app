require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@scraped_props = []
  @@props = []

  def self.scrape_page
    @doc = Nokogiri::HTML(open(ESPN))
    @@scraped_props = @doc.css("div .matchup-container")
    @@scraped_props.size
  end

  def self.scrape_props
    @@scraped_props.each_with_index do |p, index|
      binding.pry
      prop = {
        prop_id_num: index + 1,
        event_title: p.css(".gamequestion").text,
        start_time: p.css("div .startTime").text,
        sport: p.css(".sport-description").text,
        away_team: p.css("td span strong")[0].text,
        home_team: "@" + p.css("td span strong")[1].text,
        prop_preview: p.css("div.matchupStatus a").attr("href").value,

        away_team_url: "http://streak.espn.com/en/" + p.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[0].attr("href"),
        home_team_url: "http://streak.espn.com/en/" + p.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[1].attr("href")
      }

        # CSS issue if one or both of opponents are ranked (i.e "#20 Auburn" steals one of the 'strong' tags and won't properly seed prop opponents from array
        if p.css("td span strong").size == 4
          prop[:away_team] = "#{p.css("td span strong")[0].text}" + "#{p.css("td span strong")[1].text}"
          prop[:home_team] = "@"+"#{p.css("td span strong")[2].text}" + "#{p.css("td span strong")[3].text}"
        elsif p.css("td span strong").size == 3 && prop[:away_team].include?("#")
          prop[:away_team] = "#{p.css("td span strong")[0].text}" + "#{p.css("td span strong")[1].text}"
          prop[:home_team] = "@"+"#{p.css("td span strong")[2].text}"
        elsif p.css("td span strong").size == 3 && prop[:home_team].include?("#")
          prop[:away_team] = "#{p.css("td span strong")[0].text}"
          prop[:home_team] = "@"+"#{p.css("td span strong")[1].text}" + "#{p.css("td span strong")[2].text}"
        else
        end
      @@props << prop
      end
    @@props
  end

  def self.all_props
    @@props
  end

  binding.pry
end

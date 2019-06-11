class Scraper

  ESPN = "http://streak.espn.com/en/"

  def self.scrape_page
    @doc = Nokogiri::HTML(open(ESPN))
    @doc.css("div .matchup-container")
  end

  def self.scrape_props
    props = scrape_page
    props.each.with_index(1) do |p, index|
      prop = Prop.new
      prop.prop_id = index
      prop.title = p.css(".gamequestion").text
      prop.start = p.css(".startTime").attr("data-locktime").value
      prop.sport = p.css(".sport-description").text
      prop.away = p.css("td span strong")[0].text
      prop.home = "@" + p.css("td span strong")[1].text
      prop.prop_preview = p.css("div.matchupStatus a").attr("href").value
      prop.away_team_url = p.css(".matchupStatus").text == "Preview" || p.css(".matchupStatus").text == "Not Started" ? "http://streak.espn.com/en/" + p.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[0].attr("href") : "http://streak.espn.com/en/"
      prop.home_team_url = p.css(".matchupStatus").text == "Preview" || p.css(".matchupStatus").text == "Not Started" ? "http://streak.espn.com/en/" + p.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[1].attr("href") : "http://streak.espn.com/en/"
      prop.matchup_status = p.css(".matchupStatus").text
        # CSS issue if one or both of opponents are ranked (i.e "#20 Auburn" steals one of the 'strong' tags and won't properly seed prop opponents from array
        if p.css("td span strong").size == 4
          prop.away = "#{p.css("td span strong")[0].text}" + "#{p.css("td span strong")[1].text}"
          prop.home = "@"+"#{p.css("td span strong")[2].text}" + "#{p.css("td span strong")[3].text}"
        elsif p.css("td span strong").size == 3 && prop.away.include?("#")
          prop.away = "#{p.css("td span strong")[0].text}" + "#{p.css("td span strong")[1].text}"
          prop.home = "@"+"#{p.css("td span strong")[2].text}"
        elsif p.css("td span strong").size == 3 && prop.home.include?("#")
          prop.away = "#{p.css("td span strong")[0].text}"
          prop.home = "@"+"#{p.css("td span strong")[1].text}" + "#{p.css("td span strong")[2].text}"
        else
        end
        prop.save
    end
  end
end

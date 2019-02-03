class RoadtripAdventures::Scraper

  def self.scrape_destinations
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/usa"))
    destinations = doc.css("a.tlist__secondary-link")

    destinations.each_with_index{ |destination, index| # Returns 10 "destination" options
    if index < 10 then
      new_destination = RoadtripAdventures::Destination.new
      new_destination.name = destinations[index].text
      new_destination.url = "https://www.lonelyplanet.com" + destinations[index].attr("href")      
    end
    }
  end

end

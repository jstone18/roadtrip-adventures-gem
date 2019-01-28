
  class RoadtripAdventures::Destination

    attr_accessor :name, :url
    @@all_destinations = []

    #1. New York City   6. New Orleans
    #2. Los Angeles     7. Washington,DC
    #3. San Francisco   8. Boston
    #4. Chicago         9. Miami
    #5. Seattle        10. Las Vegas

    def self.all_destinations
      self.class.all_destinations
    end


    def self.scrape_destinations
      doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/usa"))
      destinations = doc.css("a.tlist__secondary-link")

      destinations.each_with_index{ |destination, index|
        if index < 10 then
            new_destination = RoadtripAdventures::Destination.new
            new_destination.name = destinations[index].text
            new_destination.url = destinations[index].attr("href")
            @@all_destinations << new_destination
        end
          }
        puts @@all_destinations
    end

  end

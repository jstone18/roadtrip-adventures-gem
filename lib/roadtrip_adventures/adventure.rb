class RoadtripAdventures::Adventure

  attr_accessor :name, :url


  # Scrape data using url to create new Adventure objects
  # push new objects into an array
  def self.scrape_adventures
    adventures_list = []
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/usa/new-york-city"))
    adventures = doc.css("article.tours a")

    adventures.map.with_index{ |adventure, index|
    new_adventure = RoadtripAdventures::Adventure.new
    new_adventure.name = adventures.css("h3").text
    new_adventure.url = adventures[index].attr("href")
    adventures_list = new_adventure
    }
    # binding.pry
  end


end

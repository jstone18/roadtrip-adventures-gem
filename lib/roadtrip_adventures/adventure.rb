class RoadtripAdventures::Adventure

  attr_accessor :name, :url

  # Users input selection of 1-10 will then provide 6 different adventures for that selected destination



  # Scrape method using url to create new Adventure objects
  # push new objects into an array
  def self.scrape_adventures
    new_adventures_list = []
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/usa/new-york-city")) # Just using one destination to create functionality
    adventures = doc.css("article.tours a")

    adventures[0..-2].map.with_index{ |adventure, index| # Returns 6 "adventure" options
    new_adventure = RoadtripAdventures::Adventure.new
    new_adventure.name = adventures[index].css("h3").text
    new_adventure.url = adventures[index].attr("href")
    new_adventures_list[index] = new_adventure
    }
    # binding.pry
  end

  # Assign scrape method to a variable
  # Itterate over the returned array from scrape method and return numbered list of "adventures"
  def self.list_adventure_names
    adventures_list = self.scrape_adventures
    adventures_list.map.with_index{|a, i| puts "#{i+1}. #{a.name}"}
  end




end

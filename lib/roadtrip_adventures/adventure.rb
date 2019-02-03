class RoadtripAdventures::Adventure

  attr_accessor :name, :url, :price

  def self.list_adventure_names(destination_name)
    self.scrape_adventures(destination_name)
  end

  def self.scrape_adventures(destination_name)
    new_adventures_list = []

    url = RoadtripAdventures::Destination.url_for_destination_name(destination_name)
    doc = Nokogiri::HTML(open(url))
    adventures = doc.css("article.tours a")

    adventures[0..-2].map.with_index{ |adventure, index| # Returns 6 "adventure" options
    new_adventure = RoadtripAdventures::Adventure.new
    new_adventure.name = adventures[index].css("h3").text
    new_adventure.price = adventures[index].css("span.tour__price").text
    new_adventure.url = adventures[index].attr("href")
    new_adventures_list[index] = new_adventure }
  end

end

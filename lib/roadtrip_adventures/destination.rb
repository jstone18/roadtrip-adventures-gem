class RoadtripAdventures::Destination

  attr_accessor :name, :url
  @@destinations = []

  def initialize
    @@destinations << self
  end

  def self.all
    @@destinations
  end

  def self.url_for_destination_name(destination_url)
  "https://www.lonelyplanet.com/#{destination_url.downcase.gsub(/[\s,]+/,"-")}/"
  end

end

class RoadtripAdventures::Destination

  attr_accessor :name, :url
  @@destinations = []

  def initialize
    @@destinations << self
  end

  def self.all
    @@destinations
  end

  def self.url_for_destination_name(destination_name)
  "https://www.lonelyplanet.com/#{destination_name.downcase.gsub!(/[\s,]+/,"-")}/"
  end

end

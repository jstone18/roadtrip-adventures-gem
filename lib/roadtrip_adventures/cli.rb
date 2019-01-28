class RoadtripAdventures::CLI

  def call
    list_destinations
    RoadtripAdventures::Destination.list_destination_names
    dest_menu
    RoadtripAdventures::Adventure.list_adventure_names
  end

  def list_destinations
    puts "Todays Destinations."
  end

  def dest_menu
  end


  def goodbye
    puts "So long!! May your journey be filled with new adventures and excitement"
  end

end

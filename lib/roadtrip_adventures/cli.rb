class RoadtripAdventures::CLI

  def call
    welcome
    list_destinations
    menu
  end

  def welcome
    puts "Welcome to Roadtrip Adventures!"
  end

  def list_destinations
    puts "Choose the destination you'd like to explore further."
    RoadtripAdventures::Destination.list_destination_names
    puts "********************************************************"  # Divider
  end

  def menu
    input = nil

    while input != "exit"
      puts "Make a selection from 1-10"
      input = gets.strip.to_i

      if input > 0 && input < 11
        puts "********************************************************"

        puts "These are the Top 6 adventures!"
        puts RoadtripAdventures::Adventure.list_adventure_names[input-1]

        puts "Which adventure would you like more information for? 1 - 6"
        input = gets.strip.to_i
      else
        puts "You've made an invalid choice! Please try again or 'exit' to leave"
      end
    end
  end



  def goodbye
    puts "So long!! May your journey be filled with new adventures and excitement"
  end

end

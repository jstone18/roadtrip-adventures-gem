class RoadtripAdventures::CLI

  def call
    welcome
    list_destinations
    dest_menu
  end

  def welcome
    puts "Welcome to Roadtrip Adventures!"
  end

  def list_destinations
    puts "Choose the destination you'd like to explore further."
    puts "********************************************************"
    RoadtripAdventures::Destination.list_destination_names
    puts "********************************************************"  # Divider
  end

  def dest_menu
    dest_select = nil

    puts "Make a selection from 1-10:"
    dest_select = gets.strip

    while dest_select != "exit"

      if dest_select.to_i > 0 && dest_select.to_i < 11

        puts "These are the Top 6 adventures!"
        puts "********************************************************"
        puts RoadtripAdventures::Adventure.list_adventure_names[dest_select.to_i-1]
        puts "********************************************************"
        adv_menu

      else
        puts "You've made an invalid choice! Make a selection from 1-10 or 'exit' to leave"
        dest_select = gets.strip
      end
    end
    goodbye
  end

  def adv_menu
    puts "Which adventure would you like more information about? 1 - 6"
    adv_input = gets.strip

  end



  def goodbye
    puts "So long!! May your journey be filled with new adventures and excitement!!"
  end

end

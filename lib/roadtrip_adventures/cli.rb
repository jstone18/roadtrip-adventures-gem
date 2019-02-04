class RoadtripAdventures::CLI

  def call
    welcome
    RoadtripAdventures::Scraper.scrape_destinations
    list_destinations
  end

  def welcome
    puts "\nWELCOME TO ROADTRIP ADVENTURES!\n".colorize(:yellow)
  end

  def list_destinations
     puts "**********DESTINATIONS**********\n".colorize(:blue)
     destination_arr = RoadtripAdventures::Destination.all
     puts  destination_arr.map.with_index{|destination, index| "\t#{index+1}. #{destination.name}"}
     puts "\n********************************".colorize(:blue)
     puts "Select a destination from 1-10:".colorize(:yellow)
     puts "********************************".colorize(:blue)
     select_destination(destination_arr)
  end

  def select_destination(destination_arr)
    input = nil

    while input != 'exit'
      input = gets.to_i

      if input > 0 && input < 11
        destination_name = destination_arr[input-1].name.strip
        destination_url = destination_arr[input-1].url
        # puts "\nHere are the top 6 adventures for #{destination_name}\n".colorize(:yellow)
        puts "******************** ".colorize(:blue) + "#{destination_name.upcase} ADVENTURES".colorize(:yellow) + " ********************\n".colorize(:blue)
        list_adventures(destination_name)
        puts "**********************************************************".colorize(:blue)
      else
        puts "You've made an invalid choice! Make a selection from 1-10 or 'exit' to leave".colorize(:light_blue)
        input = gets.strip
      end
    end
    goodbye if input == "exit"
  end

  def list_adventures(destination_name)
    adventure_arr = RoadtripAdventures::Adventure.list_adventure_names(destination_name)
    puts adventure_arr.map.with_index{|d, index| "#{index+1}. #{d.name}, #{d.price}"}
    puts "\n**********************************************************".colorize(:blue)
    puts "Please choose another destination 1-10 or 'exit' to leave.".colorize(:yellow)
  end

  def goodbye
    puts "So long!! May your journey be filled with new adventures and excitement!!".colorize(:yellow)
  end


end

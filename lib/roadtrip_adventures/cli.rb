class RoadtripAdventures::CLI

  def call
    welcome
    RoadtripAdventures::Scraper.scrape_destinations
    list_destinations
  end

  def welcome
    puts "Welcome to Roadtrip Adventures!"
  end

  def list_destinations
     puts "Please select a destination from 1-10"

     destination_arr = RoadtripAdventures::Destination.all
     puts  destination_arr.map.with_index{|destination, index| "\t#{index+1}. #{destination.name}"}
     puts "********************************************************"
     select_destination(destination_arr)
  end

  def select_destination(destination_arr)
    input = nil
    while input != 'exit'
      input = gets.to_i

      if input > 0 && input < 11
        puts "********************************************************"
        destination_name = destination_arr[input-1].name.strip
        destination_url = destination_arr[input-1].url
        puts "Here are the top 6 adventures for #{destination_name}\n"
        list_adventures(destination_name)
      else
        puts "You've made an invalid choice! Make a selection from 1-10 or 'exit' to leave"
        input = gets.strip
      end
    end
    goodbye if input == "exit"

  end

  def list_adventures(destination_name)
    puts "Please select an adventure from 1-6"
    adventure_arr = RoadtripAdventures::Adventure.list_adventure_names(destination_name)

    puts adventure_arr.map.with_index{|d, index| "\t#{index+1}. #{d.name}, #{d.price}"}
    puts "********************************************************"
    puts "Please choose another destination 1-10 or 'exit' to leave."

  end

  def goodbye
    puts "So long!! May your journey be filled with new adventures and excitement!!"
  end

end

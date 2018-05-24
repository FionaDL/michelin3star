
class Michelin3star::CLI

  def call
    puts"Welcome! Would you like to check out some Three star Michelin restaurants?"
    puts "If your answer is yes, you've come to the right place!"
    puts "----------------"
    scraper = Michelin3star::Scraper.new
    scraper.make_restaurants
    first_choice
  end


    #giving the user the option of seeing an alphabetized list of all the restaurants, and then the ability to choose one for more information, or to first see a list of countries, and then see the list of restaurants under that country. Then they would also have the ability to choose a restaurant for more information.
  def first_choice
    puts "Choose one of the following options by typing 1 or 2."
    puts "1.List all of the Three Star Michelin Restaurants in the world."
    puts "2.List all of the countries where Three Star Michelin restaurants exist."
    puts "  Please type exit to leave the program at any time."
    puts "----------------"
    input = gets.strip
      case input
      when "1"
        self.print_restaurant_names
        puts "----------------"
        puts "Please type the name of a restaurant to see some more information."
        puts "----------------"
        more_restaurant_info
        second_choice
      when "2"
        self.print_country_names
        puts "----------------"
        puts "Type a country to see all the Three Star Michelin restaurants from that country."
        puts "----------------"
        list_by_country
        puts "----------------"
        puts "Please type the name of a restaurant to see some more information."
        puts "----------------"
        more_restaurant_info
        second_choice
      when "exit"
        goodbye
      else
        puts "----------------"
        puts "You seemed to have entered something other then 1 or 2, please try again."
        first_choice
    end
  end

    def more_restaurant_info
      input = gets.strip.downcase
      new_input = input.split.map{|x| x.capitalize}.join(' ')
      called_restaurant = Michelin3star::Restaurants.find_by_name(new_input)
      puts "----------------"
      if input == "exit"
        goodbye
      elsif called_restaurant == nil
        puts "You may have entered the restaurant incorrectly, please check spelling and enter again."
        puts "----------------"
        more_restaurant_info
      else
        puts "You have selected #{called_restaurant.name}."
        puts "This restaurant is located in #{called_restaurant.location}, #{called_restaurant.country}."
        puts "The chef(s) is #{called_restaurant.chef}."
        puts "The restaurant has held 3 stars since #{called_restaurant.year}."
        puts "----------------"
      end
    end

    def list_by_country
      input = gets.strip.downcase
      @country = Michelin3star::Country.find_by_name(input)
      puts "----------------"
      if @country == nil
        puts "You may have entered the country incorrectly, please check spelling and enter again."
        puts "----------------"
        list_by_country
      elsif input == "exit"
        puts "----------------"
        goodbye
      else
        puts "----------------"
        print_country_restaurant_names
      end
    end

    def second_choice
      puts "Would you like to see infomation for another restaurant? y/n"
      puts "----------------"
        input = gets.strip.downcase
      case input
      when "exit"
        goodbye
      when "y"
        self.print_restaurant_names
        puts "----------------"
        puts "Please type the name of a restaurant to see some more information."
        puts "----------------"
        more_restaurant_info
        second_choice
      when "n"
        puts "----------------"
        list_by_country_y_n
      else
        puts "Not a valid entry, please type y for yes or n for no."
        puts "----------------"
        second_choice
      end
    end

    def list_by_country_y_n
      puts "Would you like to see the list of countries? y/n"
      puts "----------------"
      input = gets.strip.downcase
      case input
      when "exit"
        puts "----------------"
        goodbye
      when "y"
        puts "----------------"
        self.print_country_names
        puts "----------------"
        puts "Type a country to see all the Three Star Michelin restaurants from that country."
        puts "----------------"
        list_by_country
        puts "----------------"
        puts "Please type the name of a restaurant to see some more information."
        puts "----------------"
        more_restaurant_info
        second_choice
      when "n"
        puts "----------------"
        exit_program
      when "exit"
        goodbye
      else
        puts "Not a valid entry, please type y for yes or n for no."
        puts "----------------"
        list_by_country_y_n
      end
    end

    def exit_program
      puts "Would you like to exit the program? y/n?"
      puts "----------------"
      input = gets.strip.downcase
      case input
      when "n"
        puts "----------------"
        second_choice
      when "y"
        puts "----------------"
        goodbye
      else
        puts "Not a valid entry, please type y for yes or n for no."
        puts "----------------"
        exit_program
      end
    end

    def goodbye
      puts "Goodbye, we hope your next meal is delicious!"
      puts "----------------"
      exit
    end

    def print_restaurant_names
      Michelin3star::Restaurants.all_by_name.sort!.each do |restaurant|
        puts "#{restaurant}"
      end
    end

    def print_country_names
      Michelin3star::Country.all_by_name.sort!.each do |country|
        puts "#{country}"
      end
    end

    def print_country_restaurant_names
      @country.all_restaurants_by_name.sort!.each do |country|
        puts "#{country}"
      end
    end


end

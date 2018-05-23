
class Michelin3star::CLI

  def call
    puts"Welcome! Would you like to check out some Three star Michelin restaurants?"
    puts "If your answer is yes, you've come to the right place!"
    puts "Choose one of the following options by typing 1 or 2."
    puts "1.Would you like to see all of the Three Star Michelin Restaurants in the world?"
    puts "2.Would you prefer to see all of the countries where Three Star Michelin restaurants exsist?"
    scraper = Michelin3star::Scraper.new
    scraper.make_restaurants
    first_choice
  end


    #giving the user the option of seeing an alphabetized list of all the restaurants, and then the ability to choose one for more information, or to first see a list of countries, and then see the list of restaurants under that country. Then they would also have the ability to choose a restaurant for more information.
  def first_choice
    input = gets.strip
      case input
      when "1"
        self.print_restaurant_names
        puts "Please type the name of a restaurant to see some more information."
        more_restaurant_info
        second_choice
      when "2"
        Michelin3star::Country.print_country_names
        puts "Type a country to see all the Three Star Michelin restaurants from that country."
        list_by_country
        puts "Please type the name of a restaurant to see some more information."
        more_restaurant_info
        second_choice
      end
  end

    def more_restaurant_info
      input = gets.strip.downcase
      new_input = input.split.map{|x| x.capitalize}.join(' ')
      called_restaurant = Michelin3star::Restaurants.find_by_name(new_input)
      if called_restaurant == nil
        puts "You may have entered the restaurant incorrectly, please check spelling and enter again."
        more_restaurant_info
      else
        puts "You have selected #{called_restaurant.name}."
        puts "This restaurant is located in #{called_restaurant.location}, #{called_restaurant.country}."
        puts "The chef(s) is #{called_restaurant.chef}."
        puts "The restaurant has held 3 stars since #{called_restaurant.year}."
      end
    end

    def list_by_country
      input = gets.strip.downcase
      list = Michelin3star::Country.find_by_name(input)
      if list == nil
        puts "You may have entered the country incorrectly, please check spelling and enter again."
        list_by_country
      else
        list.print_country_names
      end
    end

    def second_choice
      puts "Would you like see infomation for another restaurant? y/n"
        input = gets.strip.downcase
      case input
      when input != "y" || input != "n"
        puts "Not a valid entry, please type y for yes or n for no."
      when "y"
        Michelin3star::Restaurants.print_restaurant_names
        puts "Please type the name of a restaurant to see some more information."
        more_restaurant_info
        second_choice
      when "n"
        list_by_country_y_n
      end
    end

    def list_by_country_y_n
      puts "Would you like to see the list of countries? y/n"
      input = gets.strip.downcase
      case input
      when input != "y" || input != "n"
        puts "Not a valid entry, please type y for yes or n for no."
      when "y"
        Michelin3star::Country.print_country_names
        puts "Type a country to see all the Three Star Michelin restaurants from that country."
        list_by_country
        puts "Please type the name of a restaurant to see some more information."
        more_restaurant_info
        second_choice
      when "n"
        exit_program
      end
    end

    def exit_program
      puts "Would you like to exit the program? y/n?"
      input = gets.strip.downcase
      case input
      when input != "y" || input != "n"
        puts "Not a valid entry, please type y for yes or n for no."
      when input == "y"
        exit
      when input == "n"
        second_choice
      end
    end

    def print_restaurant_names
      Michelin3star::Restaurants.all_by_name.sort!.each do |restaurant|
        puts "#{restaurant}"
      end
    end


end

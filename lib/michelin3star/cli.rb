require 'pry'

class CLI

  def call
    puts"Hello, would you like to check out some three star Michelin restaurants? If your answer is yes, you've come to the right place!"
    puts "If you would like to see the names of all the Three Star Michelin restaurants in the world type 1. If you prefer to see a list of countries where Three Star Michelin restaurants exist type 2."
    scraper = Scraper.new
    scraper.make_restaurants
    first_choice
    second_choice
  end


    #id giving the user the option of seeing an alphabetized list of all the restaurants, and then the ability to choose one for more information, or to first see a list of countries, and then see the list of restaurants under that country. Then they would also have the ability to choose a restaurant for more information.
  def first_choice
    input = gets.strip
      case input
      when "1"
        Restaurants.print_restaurant_names
        more_restaurant_info
      when "2"
        Country.all
        binding.pry
        puts "Type a country to see all the Three Star Michelin restaurants from that country."
        list_by_country
      end
  end

    def more_restaurant_info
      puts "Please type the name of a restaurant to see some more information."
      input = gets.strip.downcase
      new_input = input.split.map{|x| x.capitalize}.join(' ')
      called_restaurant = Restaurants.find_by_name(new_input)
      puts "You have selected #{called_restaurant.name}."
      puts "This restaurant is located in #{called_restaurant.location},#{called_restaurant.country}."
      puts "The chef(s) is #{called_restaurant.chef}."
      puts "The restaurant has held 3 stars since #{called_restaurants.year}."
    end

    def list_by_country
      input = gets.strip
      list = Restaurants.find_by_country(input)
      list.collect {|restaurant| restaurant.name }
    end

end

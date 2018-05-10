require 'pry'

class CLI

  def call
    puts"Hello, would you like to check out some three star Michelin restaurants? If your answer is yes, you've come to the right place!"
    puts "If you would like to see the names of all the Three Star Michelin restaurants in the world type 1. If you prefer to see a list of countries where Three Star Michelin restaurants exist type 2."
    scraper = Scraper.new
    scraper.assign_country
    scraper.make_restaurants
  end


    #id giving the user the option of seeing an alphabetized list of all the restaurants, and then the ability to choose one for more information, or to first see a list of countries, and then see the list of restaurants under that country. Then they would also have the ability to choose a restaurant for more information.
  def first_choice
    input = gets.strip
      case input
      when "1"
        Restaurants.all.name.sort!
        more_restaurant_info
      when "2"
        Country.all.name
        puts "Type a country to see all the Three Star Michelin restaurants from that country."
        list_by_country

        puts
      end
  end

    def more_restaurant_info
      puts "Please type the name of a restaurant to see more infomation!"
      input = gets.strip.downcase
      called_restaurant = Restaurants.find_by_name(input)
      puts "You have selected #{called_restaurant}."
      puts "The location is: #{called_restaurant.location}."
      puts "The Chef is: #{called_restaurant.chef}."
    end

    def list_by_country
      input = gets.strip.downcase
      list = Restaurants.find_by_country(input)
      list.collect {|restaurant| restaurant.name }
    end

end

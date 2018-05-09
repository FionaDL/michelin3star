require 'pry'

class CLI

  def call
    puts"Hello, would you like to check out some three star Michelin restaurants? If your answer is yes, you've come to the right place!"
    puts "If you would like to see the names of all the Three Star Michelin restaurants in the world type 1. If you prefer to see a list of countries where Three Star Michelin restaurants exist type 2."
    first_choice

    binding.pry
    end

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
      input = gets.strip
      called_restaurant = Restaurants.find_by_name(input)
      puts "You have selected #{called_restaurant}."
      puts "The location is: #{called_restaurant.location}."
      puts "The Chef is: #{called_restaurant.chef}."
    end

    def list_by_country
      input = gets.strip
      list = Restaurants.find_by_country(input)
      list.collect {|restaurant| restaurant.name }
    end

      #def self.find_by_country(country)
      #  @@all.find_all {|restaurant| restaurant.country == country}
    #  end





end

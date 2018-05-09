require 'pry'

class CLI

  def call
    puts"Hello, would you like to check out some three star Michelin restaurants? If your answer is yes, you've come to the right place!"
    puts "If you would like to see the names of all the Michelin Three Star restaurants in the world type 1. If you prefer to see a list of countries where Michelin 3 star restaurants exist type 2."
    restaurant_list
    binding.pry
    end

  def first_choice
    input = gets.strip
    case input
    when "1"
      Restaurants.all.name
    when "2"
      Country.all.name
    end
  end

  def restaurant_list
    input = gets.strip
    case input
    when "y"
      Restaurants.all
    when "n"
    end
  end

end

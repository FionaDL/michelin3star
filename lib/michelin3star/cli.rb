require 'pry'

class CLI

  def call
    puts"Hello, would you like to check out some three star Michelin restaurants? You've come to the right place."
    puts "Would you like to list all of the Michelin 3 Star Michelin Restaurants in the World? y/n"
    restaurant_list
    scraper = Scraper.new
    scraper.get_country_data
    scraper.restaurant_rows
    binding.pry
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

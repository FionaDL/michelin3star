require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper

  #trying to create a nested array/hash that I will be able to use to call certain elements. {belgium => [{location=> ?, name=> ?, chef=> ?,},{location=> ?, name=> ?, chef=> ?,}], usa => ...}


  def get_page
      doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Michelin_3-star_restaurants"))
  end
#use the "h3" to call all of the arrays of "h3" that should include the text with the name of the country.Figure out why it is also returning a bunch of " "
  def get_country_data
     get_page.css("h3").collect do |country|
      country.css(" .mw-headline").text
    end
  end

  #def get_restaurant_data
    #get_page.css("table").collect do |table|
      #table.css("th").collect do |info|
      #  info.text
    #  end
    #end
  #end

  def restaurant_arrays
    array_of_tables = []
    get_page.css("div .mw-parser-output table").each do |table|
      array_of_tables << table
    end
  array_of_tables
  end

  def restaurant_info
    restaurant_arrays.each do |table|
      table.css("tr")[1].css("td")[0].text
      binding.pry
    end
  end


end

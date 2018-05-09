require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './restaurants.rb'


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

  def table_arrays
      self.get_page.css("table").css(".wikitable").collect do |table|
         table.css("tr:nth-child(n+2)")
      end
  end

  #table_of_rows is returning a nested array of all the tables, and all the rows inside of all the table, now I need to pull out the rows.

  def make_restaurants
    self.table_arrays.each do |table|
        table.each do |row|
          location = row.css("td")[0].text
          name = row.css("td")[1].text
          chef = row.css("td")[2].text
          restaurant = Restaurants.new
          restaurant.location = location
          restaurant.name = name
          restaurant.chef = chef
        end
      end  #assign that to a hash
    end


  def row_info
    counter = 1
    counted = table
    table_rows.collect do |row|
       until counter == counted
         rows[counter]
         counter += 1
         binding.pry
       end
     end
   end


    def restaurant_info
      location = row.css("td")[0].text
      name = row.css("td")[1].text
      chef = row.css("td")[2].text
      restaurants = {"Location" => "#{location}", "Name" => "#{name}", "Chef(s)" => "#{chef}"}
    end


end

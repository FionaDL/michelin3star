
class Michelin3star::Scraper

  def get_page
      doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Michelin_3-star_restaurants"))
  end
#use the "h3" to call all of the arrays of "h3" that should include the text with the name of the country.Figure out why it is also returning a bunch of " "
  def get_country_data
     get_page.css("h3").collect do |country|
      country.css(" .mw-headline").text.lstrip
    end
  end

  #makes an array of tables and gets rid of the first row of each table.
  def table_arrays
      self.get_page.css("table").css(".wikitable").collect do |table|
         table.css("tr:nth-child(n+2)")
      end
  end


  #should be going through every row in each individual table(except the first row)and creating a new restaurant object from each row.

  def make_restaurants
    self.table_arrays.each_with_index do |table, i|
          @country = get_country_data[i]
        table.each do |row|
          restaurant = Restaurants.new
          restaurant.location = row.css("td")[0].text
          restaurant.name = row.css("td")[1].text
          restaurant.chef = row.css("td")[2].text.gsub(/[^a-zA-Z ,]/, "")
          restaurant.year = row.css("td")[3].text[0...4]
          restaurant.country = @country
          country = Country.find_or_create_by_name(restaurant.country)
          country.save_to_restaurants(restaurant)
        end
      end
    end

end

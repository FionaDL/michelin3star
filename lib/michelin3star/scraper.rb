require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper

  def get_page
      doc = Nokogiri::HTML(open(https://en.wikipedia.org/wiki/List_of_Michelin_3-star_restaurants))
  end
#need to use a CSV ?
  def get_restaurant_data
    get_page.css.
  end

end

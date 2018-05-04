require 'nokogiri'
require 'open-uri'


class Michelin3star::Scraper

  def get_page
      doc = Nokogiri::HTML(open(https://en.wikipedia.org/wiki/List_of_Michelin_3-star_restaurants))
  end
  
end

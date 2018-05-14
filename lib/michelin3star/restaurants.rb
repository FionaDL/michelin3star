require 'pry'


class Restaurants

  attr_accessor :name, :country, :location, :chef, :year
  @@all = []

  def initialize
    save
    binding.pry
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.all_by_name
    @@all.map do |restaurant|
      restaurant.name
    end
  end

  def self.print_restaurant_names
    all_by_name.sort!.each do |restaurant|
      puts "#{restaurant}"
    end
  end

  def self.find_by_name(name)
    self.all.find { |restaurant| restaurant.name == name }
  end

  def self.find_by_country(country)
    self.all.find {|restaurant| restaurant.country == country}
  end

  def self.create_country(restaurant_object)
    if Restaurants.find_by_country(restaurant_object.country) == nil
      new_country = Country.new(restaurant_object.country)
      @name = self.country
      @restaurant = self.name
    end
  end


end

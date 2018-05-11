require 'pry'

class Restaurants

  attr_accessor :name, :country, :location, :chef, :year
  @@all = []

  def initialize
    save
    @country = self.country
    self.create_country(@country)
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

  def create_country(country)
    if @@all.find {|restaurant| restaurant.country == country} == nil
      new_country = Country.new(country)
    end
  end


end

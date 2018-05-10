require 'pry'

class Restaurants

  attr_accessor :name, :country, :location, :chef
  @@all = []

  def initialize
    save
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



  def self.find_by_name(name)
    self.all.find { |restaurant| restaurant.name == name }
  end

  def self.find_by_country(country)
    @@all.find_all {|restaurant| restaurant.country == country}
  end


end

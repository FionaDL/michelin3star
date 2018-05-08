require 'pry'

class Restaurants

  attr_accessor :name, :country, :location, :chef
  @@all = []

  def initialize
    @name = name
    @country = country
    @location = location
    @chef = chef
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_by_name
    @@all.map do |restaurant|
      restaurant.name
    end
  end

  def create_by_file(file)
  end

end

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

  def create_by_file(file)
  end

end

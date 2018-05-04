require 'pry'

class restaurants

  attr_accessor :name, :country, :location, :chef
  @@all = []

  def initialize(name, country, location, chef)
    @name = name
    @country = country
    @location = location
    @chef = chef
    @@all << self
  end

  def all
    @@all
  end

  def create_by_file(file)
  end

end

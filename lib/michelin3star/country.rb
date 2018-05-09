class Country

  attr_accessor :restaurant, :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  #adds a new restaurant to a country
  #def add_restaurant(restaurant)
  #  unless restaurant.country
      #restaurant.country = self
  #  end
  #end
#end

  #want to call country.restaurants to get all the restaurants for that country

  def restaurants
    self.name
  end

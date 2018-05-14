class Country

  attr_accessor :restaurants, :name

  @@all = []

  def initialize(name)
    @name = name
    @restaurants = []
    @@all << self
  end

  def self.all
    @@all
  end

  def create_country(restaurant)
    new_country = restaurant.country
    new_country1 = self.new(new_country)
    new_country1
  end

  #adds a new restaurant to a country
  #def add_restaurant(restaurant)
  #  unless restaurant.country
      #restaurant.country = self
  #  end
  #end
#end

  def self.find_by_name(name)
    self.all.find {|country| country.name == name }
  end

end

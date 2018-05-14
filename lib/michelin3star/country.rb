class Country

  attr_accessor :restaurants, :name

  @@all = []

  def initialize(name)
    @name = name
    @restaurants = []
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(country)
      if Restaurants.find_by_country(restaurant_object.country) == nil
        new_country = Country.new(restaurant_object.country)
        @name = self.country
        @restaurant = self.name
      end
    end
  end

  def self.create(country)
  new_country = self.new(country)
  new_country
end

def find_or_create_by_name(name)
  find_by_name(name) ? find_by_name(name) : create(name)
end


  def self.find_by_name(name)
    self.all.find {|country| country.name == name }
  end

end

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

  def self.all_by_name
    self.all.map {|country| country.name}
  end

  def self.print_country_names
    self.all_by_name.sort!.each do |country|
      puts "#{country}"
    end
  end

  def save_to_restaurants(restaurant)
    @restaurants << restaurant
  end

  def all_by_name
    restaurants.map do |restaurant|
      restaurant.name
    end
  end

  def print_country_names
    all_by_name.sort!.each do |country|
      puts "#{country}"
    end
  end


  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end


  def self.create(name)
    new_country = self.new(name)
    new_country
  end

  def self.find_by_name(name)
    self.all.find {|country| country.name.downcase == name.downcase}
  end

end

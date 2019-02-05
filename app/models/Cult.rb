class Cult
  attr_accessor :name, :location, :slogan, :founding_year

  @@all_cults = []

  def initialize(name)
    @name = name
    @@all_cults << self
  end

  def self.all
    @@all_cults
  end

  def recruit_follower(follower)
    BloodOath.new(follower, self)
  end

  def cult_population
    BloodOath.all.count { |bo| bo.cult == self }
  end

  def self.find_by_name(name)
    Cult.all.select { |cult| cult.name == name }
  end

  def self.find_by_location(location)
    Cult.all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year(year)
    Cult.all.select { |cult| cult.founding_year == year }
  end
end

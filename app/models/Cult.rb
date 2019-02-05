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

  def all_followers
    BloodOath.all.each_with_object([]) { |bo, a| a << bo.follower if bo.cult == self }
  end

  def average_age
    self.all_followers.reduce(0) { |m, person| m + person.age }.to_f / self.all_followers.count
  end

  def my_followers_mottos
    self.all_followers.each { |person| puts person.life_motto }
  end

  def self.least_popular
    self.all.each_with_object({}) { |cult, a| a[cult] = cult.all_followers.count }
        .min_by { |k, v| v }
  end

  def self.most_common_location

  end
end

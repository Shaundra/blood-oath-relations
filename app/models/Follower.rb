class Follower
  attr_accessor :name, :age, :life_motto

  @@all_followers = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all_followers << self
  end

  def self.all
    @@all_followers
  end

  def cults
    BloodOath.all.each_with_object([]) { |bo, a| a << bo.cult if bo.follower == self }
  end

  def join_cult(cult)
    BloodOath.new(self, cult)
  end

  def self.of_a_certain_age(age)
    Follower.all.select { |person| person.age >= age }
  end
end

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

  def my_cults_slogans
    self.cults.each { |cult| puts cult.slogan }
  end

  def self.most_active
    BloodOath.all.group_by { |bo| bo.follower }
              .max_by { |k, v| v.count }
              .first
  end

  def self.top_ten
    # BloodOath.all.group_by { |bo| bo.follower }
    #           .sort_by { |k, v| -v.count }
    #           .keys.first(10)
  end
end

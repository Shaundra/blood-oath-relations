class BloodOath
  attr_accessor :follower, :cult, :initiation_date

  @@all_blood_oaths = []

  def initialize(follower, cult, initiation_date = Date.today)
    @follower = follower
    @cult = cult
    @initiation_date = initiation_date

    @@all_blood_oaths << self
  end

  def self.all
    @@all_blood_oaths
  end

end

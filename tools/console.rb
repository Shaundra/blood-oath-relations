require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

nneka = Follower.new("Nneka", 24)
obinna = Follower.new("Obinna", 17)
lamont = Follower.new("Lamont", 48)

blue_cult = Cult.new("Blue Cult")
red_cult = Cult.new("Red Cult")
blue_cult.founding_year = 1967
blue_cult.location = "L.A."
red_cult.founding_year = 2018
red_cult.location = "San Diego"


nneka_blue = BloodOath.new(nneka, blue_cult, Date.today - 60)
nneka_red = BloodOath.new(nneka, red_cult, Date.today)
lamont_blue = BloodOath.new(lamont, blue_cult, Date.today - 30)

binding.pry
0 # just in case pry is buggy and exits

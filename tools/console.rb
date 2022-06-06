require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# ===== TESTING ===== #

# == create Cult instances ==
majestic = Cult.new("Majestic", "New York", 2005, "We kill!")
tornado = Cult.new("Tornado", "New York", 1999, "We storm!")
blessed = Cult.new("Blessed", "San Francisco", 1870, "Literally lol.")

# == create Follower instances ==
mxm = Follower.new("MXM", 34, "Kill, kill, kill.")
dba = Follower.new("DBA", 20, "Hello, world!")
tbh = Follower.new("TBH", 12, "Goo goo gah gah.")
xxx = Follower.new("XXX", 27, "Yes, queen!")

# == create BloodOath instances ==
s1 = BloodOath.new(mxm, majestic)
s2 = BloodOath.new(dba, majestic)
s3 = BloodOath.new(dba, tornado)
s4 = BloodOath.new(tbh, tornado)
s5 = BloodOath.new(xxx, blessed)
s6 = BloodOath.new(xxx, tornado)
s7 = BloodOath.new(xxx, majestic)


# ===== TESTING ===== #

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
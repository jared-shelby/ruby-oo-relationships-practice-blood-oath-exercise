class Cult
    # store all Cult instances
    @@all = []
    
    # read/write to Cult instance attributes
    attr_reader :name, :location, :founding_year, :slogan

    # store each instance of Cult
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    # return all Cult instances
    def self.all
        @@all
    end

    # add Follower to list of Cult instance's followers
    def recruit_follower(follower)
        BloodOath.new(follower, self)
    end

    # return list of Cult instance's followers
    def followers
        BloodOath.all.select { |oath| oath.cult == self }.collect { |oath| oath.follower }
    end

    # return number of followers in Cult instance using BloodOaths
    def cult_population
        followers.count
    end

    # return Cult instance that matches string passed in
    def self.find_by_name(cult_name)
        self.all.detect { |cult| cult.name == cult_name }
    end

    # return array of Cult instances located in string passed in
    def self.find_by_location(cult_location)
        self.all.select { |cult| cult.location == cult_location }
    end

    # return array of Cult instances founded in year passed in
    def self.find_by_founding_year(year)
        self.all.select { |cult| cult.founding_year == year }
    end

    # return average age of Cult instance's followers
    def average_age
        followers.collect { |follower| follower.age }.sum.to_f / self.cult_population
    end

    # return all of this Cult instance's follower mottos
    def my_followers_mottos
        followers.collect { |follower| follower.life_motto }
    end

    # return cult with least number of followers
    def self.least_popular
        self.all.min_by { |cult| cult.cult_population }
    end

    # create hash of locations and their # of cults
    def self.hash_locations_count
        self.all.collect { |cult| cult.location }.tally
    end

    # return string of location with the most cults
    def self.most_common_location
        self.hash_locations_count.max_by { |key, value| value }[0]
    end
end
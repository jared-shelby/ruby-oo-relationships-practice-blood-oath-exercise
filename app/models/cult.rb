class Cult
    # store all Cult instances
    @@all = []
    
    # read/write to Cult instance attributes
    attr_reader :name, :location, :founding_year, :slogan
    attr_accessor :cult_population, :followers

    # store each instance of Cult
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @followers = []
        @@all << self
    end

    # return all Cult instances
    def self.all
        @@all
    end

    # add Follower to list of Cult instance's followers
    def recruit_follower(follower)
        self.followers.push(follower)
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
        self.all.select { |cult| cult.year == year }
    end
end
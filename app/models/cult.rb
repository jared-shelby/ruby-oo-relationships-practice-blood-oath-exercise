class Cult
    # store all Cult instances
    @@all = []
    
    # read/write to Cult instance attributes
    attr_accessor :name, :location, :founding_year, :slogan, :cult_population, :followers

    # store each instance of Cult
    def initialize
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
end
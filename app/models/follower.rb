class Follower
    # store all Follower instances
    @@all = []

    # provide reader access
    attr_reader :name, :age, :life_motto

    # initialize
    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    # return all Follower instances
    def self.all
        @@all
    end

    # return array of Cult instances where this Follower is included in the followers list
    def cults
        BloodOath.all.select { |oath| oath.follower == self }.collect { |oath| oath.cult }
    end

    # recruit this Follower instance within the followers list of the given cult
    def join_cult(cult)
        cult.recruit_follower(self)
    end

    # return array of Follower instances who are >= age given
    def self.of_a_certain_age(age)
        self.all.select { |follower| follower.age >= age }
    end

    # return slogan for each Cult instance this Follower instance belongs to
    def my_cults_slogans
        self.cults.collect { |cult| cult.slogan }
    end

    # create hash of followers and their # of cults joined
    def self.hash_follower_to_num_cults
        hash = {}
        self.all.each { |follower| hash[follower] = follower.cults.count }
        hash
    end

    # return Follower instance who has joined the most cults
    def self.most_active
        self.hash_follower_to_num_cults.max_by { |key, value| value }
    end

    # returns array of ten most active Follower instances
    def self.top_ten
        self.hash_follower_to_num_cults.max_by(10) { |key, value| value }
    end
end
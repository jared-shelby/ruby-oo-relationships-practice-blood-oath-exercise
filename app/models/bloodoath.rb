class BloodOath
    # store all BloodOath instances
    @@all = []

    # reader access
    attr_reader :follower, :cult, :initiation_date

    # initialize
    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @@all << self
    end

    # return all BloodOath instances
    def self.all
        @@all
    end
end
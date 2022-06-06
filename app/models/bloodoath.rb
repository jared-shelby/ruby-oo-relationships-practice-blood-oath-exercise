class BloodOath
    # store all BloodOath instances
    @@all = []

    # reader access
    attr_reader :initiation_date

    # initialize
    def initialize(initiation_date)
        @initiation_date = initiation_date
        @@all << self
    end

    # return all BloodOath instances
    def self.all
        @@all
    end
end
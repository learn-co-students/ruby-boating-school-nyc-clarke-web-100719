class BoatingTest
    attr_accessor :student, :test_name, :status, :instructor

    @@all = []
    
    def initialize(student, test_name, status, instructor)
        @student = student
        @test_name = test_name
        @status = status
        @instructor = instructor
        self.class.all << self
    end

    def self.all
        @@all
    end
end

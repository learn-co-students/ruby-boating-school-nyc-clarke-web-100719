class BoatingTest

    attr_accessor :student, :instructor, :test, :status
    @@all =[]

    def initialize (student, test, status, instructor)
        @student = student
        @instructor = instructor
        @test = test
        @status = status

        self.class.all << self
    end

    def self.all
        @@all
    end

end

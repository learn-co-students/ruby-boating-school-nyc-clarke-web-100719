class Instructor
    attr_reader :name
    attr_accessor :test_status
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def tests
        BoatingTest.all.select { |boating_test| boating_test.instructor == self}
    end

    def pass_student(student, test_name)
        tests.each do |boating_test|
            if boating_test.student == student && boating_test.test_name == test_name
                boating_test.test_status = "pass"
                return boating_test
            else
                return BoatingTest.new(student, test_name, "pass", self)
            end
        end
    end
    
    def fail_student(student, test_name)
        tests.each do |boating_test|
            if boating_test.student == student && boating_test.test_name == test_name
                boating_test.test_status == "fail"
                return boating_test
            else
                return BoatingTest.new(student, test_name, "fail", self)
            end
        end
    end
end

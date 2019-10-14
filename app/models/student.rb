class Student
    attr_accessor :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(self, test_name, status, instructor)
    end

    def self.find_student(first_name)
        self.all.find { |student| student.first_name == first_name }
    end

    def boating_tests
        BoatingTest.all.select { |boating_test| boating_test.student == self }
    end

    def grade_percentage
        num_passed_tests = boating_tests.reduce(0) do |passed_tests, boating_test|
            boating_test.status == 'passed' ? passed_tests + 1 : passed_tests
        end
        num_passed_tests / boating_tests.count.to_f * 100
    end

end

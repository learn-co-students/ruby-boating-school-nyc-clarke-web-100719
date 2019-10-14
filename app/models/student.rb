class Student
    attr_reader :first_name
    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def self.find_student(student_name)
        @@all.find { |student| student if student.first_name == student_name }
    end

    def tests
        BoatingTest.all.select { |boating_test| boating_test.student == self }
    end

    def instructors
        tests.map { |boating_test| boating_test.instructor }.uniq
    end

    def passes
        tests.select { |test| test.test_status == "pass" }
    end

    def fails
        tests.select { |test| test.test_status == "fail" }
    end

    def grade_percentage
        ((passes.length.to_f) / (tests.length) * 100).round(2)
    end
end

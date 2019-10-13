class Student

    attr_accessor :first_name
    @@all =[]

    def self.all
        @@all
    end

    def initialize(first_name)
        @first_name = first_name

        self.class.all << self
    end

    def add_boating_test(test, status, instructor)
        BoatingTest.new(self, test, status, instructor)
    end

    def self.find_student(student)
        all.find{|student_instance| student_instance.first_name == student}
    end

    def grade_percentage
        total = test_taken.count
        passed = test_taken.select{|test| test.status == "passed"}.count
        return (passed/total.to_f)*100 if total.to_f != 0
        "Grade percentage is 100 as none test has a status of passed/failed"
    end

    #private

    def tests
        BoatingTest.all.select{|test| test.student == self}
    end

    def test_taken
        tests.select{|test| test.status == "passed" || test.status == "failed" }
    end

end

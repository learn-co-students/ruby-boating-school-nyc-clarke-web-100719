class Instructor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def boating_tests
        BoatingTest.all.select { |boating_test| boating_test.instructor == self }
    end

    def students
        boating_test.map { |boating_test| boating_test.student }.uniq
    end

    def pass_student(student, test_name)
        test = find_test_by_name_and_test_name(student, test_name)
        test ? test.status = 'passed' : test = BoatingTest.new(student, test_name, 'passed', self)
        test
    end

    def fail_student(student, test_name)
        test = find_test_by_name_and_test_name(student, test_name)
        test ? test.status = 'failed' : test = BoatingTest.new(student, test_name, 'failed', self)
        test
    end

    def find_test_by_name_and_test_name(student, test_name) #searches for student that matches student and test_name criteria
        boating_tests.find { |boating_test| boating_test.student == student && boating_test.test_name == test_name }
    end

    def self.all
        @@all
    end
end

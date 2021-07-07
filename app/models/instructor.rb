class Instructor

    attr_accessor :first_name
    @@all = []

    def self.all
        @@all
    end

    def initialize(first_name)
        @first_name = first_name

        self.class.all << self
    end

    def pass_student(student, test)
        temp = BoatingTest.all.find{|test_instance| test_instance.student == student && test_instance.test == test}
        temp.status = "passed" if temp
        return temp if temp
        BoatingTest.new(student, test, "passed", self)
    end

    def fail_student(student, test)
        temp = BoatingTest.all.find{|test_instance| test_instance.student == student && test_instance.test == test}
        temp.status = "failed" if temp
        return temp if temp
        BoatingTest.new(student, test, "failed", self)
    end

end

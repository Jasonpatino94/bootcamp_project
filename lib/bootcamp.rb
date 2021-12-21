class Bootcamp

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{|h,k| h[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(name)
        @teachers << name
    end

    def enroll(name)
        if @students.length < @student_capacity
            @students << name
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        if @students.include?(student)
            return true
        else 
            return false
        end
    end

    def student_to_teacher_ratio
        (@students.length / @teachers.length).floor
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student] << grade
            true
        else
            false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if @students.include?(student)
            if @grades[student].length == 0
                return nil
            else
                total = 0
                @grades[student].each {|grade| total += grade}
                return total / @grades[student].length
            end
        else
            nil
        end
    end

end

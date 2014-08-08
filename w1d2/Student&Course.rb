class Student
 def initialize(firstname,lastname)
   @firstname = firstname
   @lastname = lastname
   @courses = []
 end
 
 def name
   "#{@firstname} #{@lastname}"
 
 
 def course
     @courses
 end
 
 def enroll course
   if has_conflict? course
     throw "'#{course.name}' conflicts with schedule"
   end
   
   unless @courses.include? course
     @courses << course
     course.add_student(self)
   end
 end

 def course_load
   course_load = Hash.new(0)
   @courses.each do |course|
     course_load[course.department] += course.credits
   end
   course_load
 end
 
 def has_conflict? course
   @courses.each do |el|
     if el.conflicts_with? course
       return true
     end
   end
   false
 end
end

class Course
  attr_reader :name, :department, :credits, :days,:blocks
  
  def initialize(name, department, credits, days, blocks)
    @name=name
    @department=department
    @credits=credits.to_i
    @enrolled = []
    @days=days
    @blocks=blocks
  end
  
  def student
    @enrolled
  end
  
  def add_student student
    @enrolled << student
  end
  def conflicts_with? (course)
    course.days.each do |day|
      if @days.include?(day) && (@blocks == course.blocks)
        return true
      end
    end
    false
  end
  
end
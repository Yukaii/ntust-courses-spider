require 'json'

class Course
  attr_accessor :course_title, :course_code, :lecturer, :credits, 
                :required_or_elective, :full_or_half_semester, :semester,
                :course_limitations, :people_in_course, :course_time_location,
                :english_course_title, :prerequisites, :course_website,
                :course_objective, :outline, :textbook, :references,
                :notice, :grading, :note, :about
  # attr_accessor :attributes

  def initialize(h)
    @attributes = [:course_title, :course_code, :lecturer, :credits, 
                   :required_or_elective, :full_or_half_semester, :semester,
                   :course_limitations, :people_in_course, :course_time_location,
                   :english_course_title, :prerequisites, :course_website,
                   :course_objective, :outline, :textbook, :references,
                   :notice, :grading, :note, :about]
    
    h.each {|k,v| send("#{k}=",v)}
  end
  
  def to_hash
    # @data = Hash[ @attributes.map {|d| [d.to_s, self.instance_variable_get('@'+d.to_s)]} ]
    {
      "course_title" => @course_title,
      "course_code" => @course_code,
      "lecturer" => @lecturer, 
      "credits" => @credits,
      "required_or_elective" => @required_or_elective,
      "full_or_half_semester" => @full_or_half_semester,
      "semester" => @semester,
      "course_limitations" => @course_limitations,
      "people_in_course" => @people_in_course,
      "course_time_location" => @course_time_location,
      "about" => @about,

      "detail" => {
        "english_course_title" => @english_course_title,
        "prerequisites" => @prerequisites,
        "course_website" => @course_website,
        "course_objective" => @course_objective,    
        "outline" => @outline,
        "textbook" => @textbook,
        "references" => @references,
        "notice" => @notice,
        "grading" => @grading,
        "note" => @note,
      }
    }    
  end

  def to_json
    JSON.pretty_generate @data
  end
end
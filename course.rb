require 'json'

class Course
  attr_accessor :title, :code, :lecturer, :credits, 
                :required, :full_or_half_semester, :semester,
                :limitations, :people_in_course, :time_location,
                :english_title, :prerequisites, :website,
                :objective, :outline, :textbook, :references,
                :notice, :grading, :note, :about, :url
  # attr_accessor :attributes

  def initialize(h)
    @attributes = [:title, :code, :lecturer, :credits, 
                   :required, :full_or_half_semester, :semester,
                   :limitations, :people_in_course, :time_location,
                   :english_title, :prerequisites, :website,
                   :objective, :outline, :textbook, :references,
                   :notice, :grading, :note, :about, :url]
    
    h.each {|k,v| send("#{k}=",v)}
  end
  
  def to_hash
    @data = Hash[ @attributes.map {|d| [d.to_s, self.instance_variable_get('@'+d.to_s)]} ]  
  end

  def to_json
    JSON.pretty_generate @data
  end
end
class CoursePdf < Prawn::Document

  def initialize(courses)
    super()
    @courses = Course.all
    course_table
  end

  def course_table
    table course_all do
      row(0).font_style = :bold
      columns(1..4).align = :center
      self.row_colors = ["DDDDDD","FFFFFF"]
      self.header = true
    end
  end

  def course_all
    [["Title", "Objective", "Description", "Instructor"]] +
    @courses.map do |course|
      [course.title, course.objective, course.description, course.instructor]
    end
  end

end
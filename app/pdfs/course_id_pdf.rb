class CourseIdPdf < Prawn::Document
  def initialize(course)
    super(top_margin: 70)
    @course = course
    course_id
    line_item_rows

  end

  def course_id
    text "Course \##{@course.id} \n",size: 25, style: :bold
  end

  def line_item_rows
   text  "Title : #{@course.title} \n Objective : #{@course.objective} \n Description : #{@course.description} \n Instructor : #{@course.instructor}",size: 16
  end

end
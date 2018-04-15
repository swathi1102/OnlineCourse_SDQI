class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CoursePdf.new(@courses)
        send_data pdf.render, filename: 'Courses.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
    @discussions = Discussion.all.order('created_at desc')
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @enrollment = Enrollment.where(:course_id => @course.id)
    @discussions = Discussion.where(:course_id => @course.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CourseIdPdf.new(@course)
        send_data pdf.render, filename: "Course_#{@course.id}.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.user = current_user

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @course.user = current_user
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :objective, :description, :instructor, :category_id, :image,
                                     :length, :effort, :price, :institution, :level, :languages, :videots, :prerequisites,
                                     pdfdocs_attributes: [:id, :name, :document, :_destroy])
    end
end

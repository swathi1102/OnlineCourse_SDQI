class EnrollmentController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  
  def index
      @course = Course.find(params[:c_id])
      @enrollments = Enrollment.where(course_id: @course.id)
      @user = User.all
  end

  def grade
    @enrollment = Enrollment.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @enrollment = current_user.enrollments.build
  end

  def create
    @enrollment = current_user.enrollments.build(enroll_params)

    if @enrollment.save
      flash[:notice] = "You enroll the course successfully!!"
      redirect_to home_study_path
    else
      flash[:alert] = "You are not enroll the course "
    end
  end

  def edit

  end

  def update

    if @enrollment.update(enroll_params)
      flash[:notice] = "Update grade for student successfully!!"
      redirect_to courses_path
    else
      flash[:alert] = "You are not update grade "
      render 'edit'
    end
  end

  private

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def enroll_params
    params.require(:enrollment).permit(:course_id, :semester, :year, :grade)
  end

end

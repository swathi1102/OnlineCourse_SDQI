class EnrollmentController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  
  def index
    @enrollments = Enrollment.all
  end

  def grade

  end

  def new
    @course = Course.find(params[:course_id])
    @enrollment = current_user.enrollments.build
  end

  def create
    @enrollment = current_user.enrollments.build(enroll_params)

    if @enrollment.save
      flash[:success] = "You enroll the course successfully!!"
      redirect_to home_study_path
    else
      flash[:danger] = "You are not enroll the course "
    end
  end

  private

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def enroll_params
    params.require(:enrollment).permit(:course_id, :semester, :year)
  end

end

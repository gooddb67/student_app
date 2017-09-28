class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      redirect_to students_path
    else
      render :new
    end
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    if @enrollment.update(enrollment_params)
      redirect_to student_path(@enrollment)
    else
      render :edit
    end
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def delete
    Enrollment.find(params[:id]).destroy
    redirect_to students_path
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:student_name, :course_name)
  end
end

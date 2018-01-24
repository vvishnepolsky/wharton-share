class CoursesController < ApplicationController

  before_action :authenticate_user!

  def show
    @course = Course.find(params[:id])
    @filetypes = FileType.all
    @assets = @course.assets
    @current_user = current_user
  end

  def new
    @course = Course.new
    @departments = Department.all
  end

  def new_course_by_department
    @departments = [Department.find(params[:id])]
    @course = Course.new
    render('new')
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "#{@course.course_description} was successfully created"
      redirect_to(departments_path)
    else
      render('new')
    end

  end


  private

  def course_params
    params.require(:course).permit(:department_id, :course_code, :course_description)
  end

end

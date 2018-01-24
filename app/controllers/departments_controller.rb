class DepartmentsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_admin, only: [:new]

  def index
    @departments = Department.sorted
    @assets= Asset.recent_uploads
    @subscriptions = UserCourse.all
  end

  def show
    @department = Department.find(params[:id])
    render json: @department, include: ['courses', 'lecturers']
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      flash[:notice] = "#{@department.department_code} was successfully created"
      redirect_to(departments_path)
    else
      render('new')
    end

  end


  private

  def department_params
    params.require(:department).permit(:department_code, :department_description)
  end

  def is_admin
    if current_user.is_admin?
      flash[:notice] = "Admin privildge granted"
    else
      flash[:notice] = "You do not have access to this functionality"
      redirect_to(departments_path)
    end
  end

end

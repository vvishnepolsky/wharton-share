class RequestsController < ApplicationController

  def index
    @requests = Request.open_requests
  end

  def new
    @request = Request.new
    @filetypes = FileType.all
    @departments = Department.all

    @first_department = @departments.first
    @courses = Course.where(department_id: @first_department.id)
    @lecturers = Lecturer.where(department_id: @first_department.id)
  end

  def create
    @request = Request.new(request_params)

    if @request.save!
      redirect_to(profile_path(current_user.id))
      flash[:notice] = 'A new request has been submitted'
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    flash[:notice] = "File was successfully Destroyed"
    redirect_to(profile_path(current_user.id))
  end

  private

  def request_params
    params.require(:request).permit(:course_id,:user_id,:file_type_id,:lecturer_id,:description)
  end

end

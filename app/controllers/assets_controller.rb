class AssetsController < ApplicationController

  before_action :authenticate_user!

  def new
    @asset = Asset.new
    @action = 'new'
    @current_year = "2018"

    if params[:request_id].present?
      @request = Request.find(params[:request_id])
      @filetypes = FileType.where(:id => @request.file_type_id)
      @courses = Course.where(:id => @request.course_id)
      @lecturers = Lecturer.where(:id => @request.lecturer_id)
    else
      @courses = [Course.find(params[:course])]
      @filetypes = FileType.all
      @lecturers = Lecturer.where(department_id: params[:department])
    end
  end

  def create
    @asset = Asset.new(asset_params)

    if @asset.save

      if @asset.request_id.present?
        @request = Request.find(@asset.request_id)
        @request.complete_request(current_user.id, @asset.id)
      end


      flash[:notice] = 'Your File has been succesfully uploaded'
      redirect_to(course_path(@asset.course))
    else
      render('new')
    end
  end

  def edit
    @asset= Asset.find(params[:id])
    @filetypes = FileType.all
    @current_year = "2018"
    @departments = Department.all
    @first_department = @departments.first
    @courses = Course.where(department_id: @first_department.id)
    @lecturers = Lecturer.where(department_id: @first_department.id)

    @action = 'edit'
  end

  def update
    @asset = Asset.find(params[:id])

    if @asset.update_attributes(asset_params)
      flash[:notice] = "File was successfully updated"
      redirect_to(course_path(@asset.course))
    else
      flash[:notice] = 'There was an error updating the file'
      redirect_to(course_path(@asset.course))
    end
  end


  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy

    flash[:notice] = "File was successfully Destroyed"
    redirect_to(course_path(@asset.course))
  end

  def index
  end

  private

  def asset_params
    params.require(:asset).permit(:filename, :course_id, :file_type_id, :url, :term, :year, :user_id, :lecturer_id, :request_id)
  end

end

class UserCoursesController < ApplicationController

  def create
    @subscription = UserCourse.new(user_course_params)
    if @subscription.save
      flash[:notice] = "You have successfully subscribed to #{Course.find(@subscription.course_id).course_description}"
      redirect_to(departments_path)
    end
  end

  def destroy
    @subscription = UserCourse.find(params[:id])
    if @subscription.destroy
      flash[:notice] = "You have successfully unsubscribed from #{Course.find(@subscription.course_id).course_description}"
      redirect_to(departments_path)
    end
  end


  private

  def user_course_params
    params.require(:user_course).permit(:user_id,:course_id)
  end

end

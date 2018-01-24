class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @assets = @user.assets
    @subscriptions = UserCourse.where(:user_id => @user.id)
    @requests = Request.where(:user_id => @user.id)
  end

end

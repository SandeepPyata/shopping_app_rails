class UsersController < ApplicationController

  def show
    @users = User.where(is_admin: false)
  end

  def destroy
    user_id = params[:id]
    user = User.find_by(id: user_id)
    user.destroy
    redirect_to show_users_path
  end

end

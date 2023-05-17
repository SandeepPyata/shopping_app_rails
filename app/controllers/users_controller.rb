class UsersController < ApplicationController

  def index
    @users = User.where(is_admin: false)
  end

  def destroy
    user_id = params[:id]
    user = User.find_by(id: user_id)
    user.destroy
    redirect_to users_path
  end

end

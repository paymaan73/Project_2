class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :skip_admin
  def index

    @users  = User.all
    @user_count  = User.all.count

  end


  def destroy

    @user = User.find(params[:id])

    if @user.destroy
      redirect_to users_path , notice: "Delete successfully user"
    end

  end



  private

  def skip_admin
    unless current_user.admin?
      redirect_to root_path, notice: "Access denied"
    end
  end
end

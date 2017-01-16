class UsersController < ApplicationController

  before_action :authenticate_user!, :only => [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:nickname)
  end
end

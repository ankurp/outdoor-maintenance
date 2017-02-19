class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @users_who_recommended = @user.users_who_recommended
  end

end

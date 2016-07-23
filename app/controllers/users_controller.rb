class UsersController < ApplicationController
  def show
    @page = current_user.pages.find_by(id: params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user

      # fetch user fav pages
      # user.pages.build?
    end
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @pages = current_user.pages.all
      @user = current_user
    else
      @user = User.new
      @user.build_fav
    end
  end

  def show
    @page = current_user.pages.find_by(id: params[:id])
  end

end

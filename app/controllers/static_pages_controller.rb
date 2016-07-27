class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @pages = current_user.pages.all
      @user = current_user

      @similar_user = User.simlilar_user_calculate(current_user)
      @similar_user_pages = @similar_user.pages.all

    else
      @user = User.new
      @user.build_fav
    end
  end

  def show
    @page = Page.find_by(id: params[:id])
    #@page = current_user.pages.find_by(id: params[:id])
  end

end

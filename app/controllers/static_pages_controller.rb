class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @pages = current_user.pages.find_by(id: current_user.id)
    else
      @user = User.new
    end
  end

end

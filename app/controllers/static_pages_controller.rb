class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to user_path(@current_user.id)
    else
      # do nothing
    end
  end

end

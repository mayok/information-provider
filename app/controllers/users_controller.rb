class UsersController < ApplicationController
  def create
    if user = User.find_by(name: params[:user][:name])
    else
      user = User.new(user_params)
      user.save

      pages = User.init_pages(params[:user][:fav_attributes])
      pages.each do |page|
        user.pages.create(page)
      end
    end

    log_in user
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user)
            .permit(:name,
                    fav_attributes: [:web,
                                     :mobile,
                                     :os,
                                     :editor,
                                     :lang,
                                     :services])
    end
end

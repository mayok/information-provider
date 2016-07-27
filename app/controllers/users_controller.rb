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

  def update
    user = User.find_by(id: params[:id])
    p user
    params[:tags].split(", ").each do |tag|
      v = user.fav.send(tag.intern)
      params[:op] == "true" ? v+=1 : v-=1
      if v<0 then v = 0 end
      user.fav.send((tag + "=").intern, v)

      user.save
    end

    render :nothing => true, :status => 200 and return
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

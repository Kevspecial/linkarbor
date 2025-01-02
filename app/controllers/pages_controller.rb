class PagesController < ApplicationController
  def home
  end
  def linktree
    @user = User.find_by(username: params[:username])
    if @user
      @links = @user.links
    else
      render plain: "User not found", status: 404
    end
  end
end

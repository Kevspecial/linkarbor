class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: [ :edit, :update, :destroy ]
  def index
    @links = current_user.links
  end

  def new
    @link = current_user.links.new
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to links_path, notice: "Link created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to links_path, notice: "Link updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_path, notice: "Link deleted successfully."
  end

  private

  def set_link
    @link = current_user.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url)
  end
end

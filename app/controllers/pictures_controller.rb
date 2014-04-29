class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(allowed_paramaters)

    if @picture.save
      redirect_to picture_path(@picture), :flash => {:success => "Picture successfully created"}
    else
      @picture
      render new_picture_path
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

  def allowed_paramaters
    params.permit(:id, :url, :description, :rating)
  end

end
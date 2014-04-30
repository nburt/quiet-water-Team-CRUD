class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(allowed_parameters)
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

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.update(params[:id], allowed_parameters)
    if @picture.valid?
      redirect_to picture_path
    else
      @picture
      render :edit
    end
  end

  def destroy
    @picture = Picture.find_by_id params[:id]
    @picture.delete
    redirect_to pictures_path
  end

  private

  def allowed_parameters
    params.permit(:id, :url, :description, :rating)
  end

end
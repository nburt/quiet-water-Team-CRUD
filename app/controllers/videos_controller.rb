class VideosController < ApplicationController

  def index

  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(
      url: params[:video_url],
      description: params[:video_description],
      rating: params[:video_rating]
    )
    if @video.save
      redirect_to "/videos/#{@video.id}", :flash => {:success => "Video successfully created"}
    else
      @video
      render :action => "new"
    end
  end

  def show
    @video = Video.find_by_id params[:id]
  end

end
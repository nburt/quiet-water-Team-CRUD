class VideosController < ApplicationController

  def index
    @videos = Video.all
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

  def edit
    @video = Video.find_by_id params[:id]
  end

  def update
    @video = Video.update(params[:id],
                          url: params[:video_url],
                          description: params[:video_description],
                          rating: params[:video_rating]
    )
    if @video.valid?
      redirect_to video_path
    else
      @video
      render :edit
    end
  end

  def destroy
    @video = Video.find_by_id params[:id]
    @video.delete
    redirect_to videos_path
  end

end
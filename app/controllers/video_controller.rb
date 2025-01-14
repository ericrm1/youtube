class VideoController < ApplicationController
  def watch
  end 

  def new
  end

  def create 
    video = Video.new(video_params)
    video.channel_id = logged_channel.id 
    if video.save
      redirect_to root_path
    else
      flash[:alert] = "Vídeo não foi cadastrado. Tente novamente." 
      render 'video/new'
    end
  end

  private
  def video_params
    params.require(:video).permit(:title, :subtitle, :description, :file, :thumbnail)
  end
end
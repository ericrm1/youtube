class VideoController < ApplicationController
  def watch
    @video = Video.find_by(id: params[:v]) # Encontra o vídeo pelo ID passado no parâmetro `v`
    @related_videos = Video.where.not(id: @video.id).limit(5) if @video # Busca outros vídeos relacionados
    
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

  def show
    @video = Video.find(params[:id])
    History.find_or_create_by(channel: current_channel, video: @video)
  end

  private
  def video_params
    params.require(:video).permit(:title, :subtitle, :description, :file, :thumbnail)
  end
end
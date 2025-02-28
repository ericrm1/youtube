class ChannelController < ApplicationController
before_action :authenticate, only: :history

    def login
    end
  
    def new
      @channel = Channel.new
    end
    
    def index
     @channel = logged_channel # canal logado
     @videos = @channel.videos
    end
   
    def create
      @channel = Channel.new(channel_params)
      if @channel.save
        flash[:notice] = "Usuário criado com sucesso!"
        redirect_to login_path
      else
        flash[:alert] = @channel.errors.full_messages.to_sentence
        render :new, status: :unprocessable_entity
      end
    end 
  
    def history
      @channel = logged_channel
      @watched_videos = logged_channel.watched_videos
    end

    def delete_video
      @channel = Channel.find(params[:channel_id])
      @video = Video.find(params[:video_id])
      @video.destroy
      redirect_to root_path, notice: 'Vídeo excluído com sucesso'
    end
    

    private
    
    def channel_params
      params.require(:channel).permit(:name, :email, :password, :password_confirmation, :photo)
    end
  end
  
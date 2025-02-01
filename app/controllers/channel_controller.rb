class ChannelController < ApplicationController
before_action :authenticate, only: :history

    def login
    end
  
    def new
      @channel = Channel.new
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
        @watched_videos = logged_channel.watched_videos
    end

    private
    
    def channel_params
      params.require(:channel).permit(:name, :email, :password, :password_confirmation, :photo)
    end
  end
  
class VideoController < ApplicationController
  def watch
    @video = Video.find_by(id: params[:v]) # Encontra o vídeo pelo ID passado no parâmetro `v`
    
    if @video.nil?
      redirect_to root_path, alert: 'Vídeo não encontrado.'
      return # Garante que o restante do método não seja executado
    end
    
    @related_videos = Video.where.not(id: @video.id).limit(5) # Busca outros vídeos relacionados
    @comments = @video.comments # Pega os comentários relacionados

    if logged?
      # puts "Logged Channel ID: #{logged_channel.id.inspect}"
      # puts "Video ID: #{@video.id.inspect}"
      # History.create!(channel_id: logged_channel.id, video_id: @video.id)
      history = History.create(channel_id: logged_channel.id, video_id: @video.id)
  puts history.errors.full_messages
    end
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

    if logged? && logged_channel
      history = History.find_or_create_by(channel: logged_channel, video: @video)
      history.touch
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :subtitle, :description, :file, :thumbnail)
  end
end

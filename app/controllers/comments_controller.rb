class CommentsController < ApplicationController

    def new 
      @comment = Comment.new        
    end 
  
    def create 
      @comment = Comment.new(comment_params)
      @comment.channel_id = logged_channel.id 
  
      if @comment.save
        redirect_to video_watch_path(@comment.video_id), notice: 'Comentário criado com sucesso.'

      else
        Rails.logger.debug("Erro ao salvar comentário: #{@comment.errors.full_messages}")
        
      end 
    end 
  
    private 
  
    def comment_params
      params.require(:comment).permit(:content, :video_id)
    end
  end
  

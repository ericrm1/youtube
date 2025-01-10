class SessionsController < ApplicationController
    def login
        channel = Channel.find_by(email: params[:email])
      
        if channel&.authenticate(params[:password])
          # Login bem-sucedido
          session[:channel_id] = channel.id
          flash[:notice] = "Login feito com sucesso!"
          redirect_to root_path # Ajuste para o caminho que você deseja redirecionar
        else
          # Falha no login
          flash[:alert] = channel.nil? ? "Usuário não encontrado. Tente novamente ou crie uma conta." : "Senha incorreta."
          render 'channel/new' # Ao invés de redirecionar, renderize novamente o formulário de login
        end
      end
  
    def logout
      session[:channel_id] = nil # Corrigido `nil`
      redirect_to root_path 
    end
  end
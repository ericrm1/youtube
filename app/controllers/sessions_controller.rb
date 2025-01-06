class SessionsController < ApplicationController
    def login
        user = User.find_by(email: params[:email])
      
        if user&.authenticate(params[:password])
          # Login bem-sucedido
          session[:user_id] = user.id
          flash[:notice] = "Login feito com sucesso!"
          redirect_to watch_path # Ajuste para o caminho que você deseja redirecionar
        else
          # Falha no login
          flash[:alert] = user.nil? ? "Usuário não encontrado. Tente novamente ou crie uma conta." : "Senha incorreta."
          render 'user/new' # Ao invés de redirecionar, renderize novamente o formulário de login
        end
      end
  
    def logout
      session[:user_id] = nil # Corrigido `nil`
      render json: { message: 'Logout realizado com sucesso' }, status: :ok
    end
  end
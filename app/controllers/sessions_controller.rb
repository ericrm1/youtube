class SessionsController < ApplicationController
    def login
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        # Login bem-sucedido
        session[:user_id] = user.id
        flash[:notice] = "Login feito com sucesso!"
        redirect_to root_path # Ajuste para o caminho que você deseja redirecionar
      else
        # Falha no login
        flash[:alert] = user.nil? ? "Usuário não encontrado. Crie uma conta para fazer login." : "Senha incorreta."
        redirect_to new_user_path # Ajuste para o caminho de criação de conta
      end
    end
  
    def logout
      session[:user_id] = nil # Corrigido `nil`
      render json: { message: 'Logout realizado com sucesso' }, status: :ok
    end
  end
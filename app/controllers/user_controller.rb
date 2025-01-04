class UserController < ApplicationController

    def login
    end
    
    def new
        @user = User.new
    end
    
    def create
        user = User.new(user_params)
         if user.save 
             flash[:notice] = "Usuário criado com sucesso!"
             redirect_to login_path

        else 
              flash[:alert] = "Não conseguimos criar a sua conta!"
              render :new
                
        end

    end 

    private
     def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
     end
end
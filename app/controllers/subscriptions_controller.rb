class SubscriptionsController < ApplicationController
    before_action :require_login

    def subscribe
        channel = Channel.find(params[:id])
            if logged_channel.subscriptions.find_by(channel: channel).nil?
                logged_channel.subscriptions.create!(channel: channel, subscriber: logged_channel)
                redirect_to video_watch_path, notice: "Você se inscreveu no canal com sucesso!"
            else
                 redirect_to video_watch_path, alert: "Você já está inscrito neste canal."
            end 
    end 
    
    def unsubscribe
        channel = Channel.find(params[:id])
        subscription = logged_channel.subscriptions.find_by(channel: channel)
        if subscription
            subscription.destroy
            redirect_to video_watch_path, notice: "Voce cancelou sua inscrição nesse canal."
        
        end
    end 

    def require_login
        unless logged?
          redirect_to login_path, alert: 'Você precisa estar logado para acessar esta página.'
        end
    end

    private
   
end

class SubscriptionsController < ApplicationController
    before_action :require_login

    def subscribe
        channel = Channel.find(params[:id])
        
            if logged_channel.subscriptions.find_by(channel: channel).nil?
                Subscription.create!(channel_id: channel.id, subscriber_id: logged_channel.id)
                redirect_to video_watch_path(v:params[:video_id]), notice: "Você se inscreveu no canal com sucesso!"
            else
                 redirect_to video_watch_path(v:params[:video_id]), alert: "Você já está inscrito neste canal."
            end 
    end 
    
    def unsubscribe
        channel = Channel.find(params[:id])
        subscription = Subscription.find_by(channel: channel, subscriber_id: logged_channel)
        if subscription
            subscription.destroy
            redirect_to video_watch_path(v:params[:video_id]), notice: "Voce cancelou sua inscrição nesse canal."
        
        end
    end 

    def require_login
        unless logged?
          redirect_to login_path, alert: 'Você precisa estar logado para acessar esta página.'
        end
    end

    private
   
end

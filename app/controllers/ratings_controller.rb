class RatingsController < ApplicationController
    # before_action :require_login
    # before_action :watching_video
    skip_before_action :verify_authenticity_token

    def require_login
        unless logged?
          redirect_to login_path, alert: 'Você precisa estar logado para acessar esta página.'
        end
    end

    def like 
        rate_video(1)
    end 

    def dislike 
        rate_video(-1)
    end

    private 

    def rate_video(value)
        rating = @video.ratings.find_or_initialize_by(channel: logged_channel)
        if rating.value == value 
            rating.destroy 
        else
            rating.update(value: value)
            redirect_to video_watch_path(v: @video.id)
        end
    end
end
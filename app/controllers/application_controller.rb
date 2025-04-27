class ApplicationController < ActionController::Base
    helper_method :logged?
    helper_method :logged_channel 
    helper_method :show
    helper_method :watching_video

    def logged?
        session[:channel_id].present?
    end 

    def authenticate
        unless logged? 
            redirect_to login_path
        end
    end

    def logged_channel
        channel = Channel.find_by_id(session[:channel_id])
        return channel
    end

    def watching_video
        @video = Video.find(params[:id])
        return @video
    end
    

 


end

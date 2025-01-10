class ApplicationController < ActionController::Base
    helper_method :logged?
    helper_method :logged_channel 
    def logged?
        session[:channel_id].present?
    end 

    def logged_channel
        channel = Channel.find_by_id(session[:channel_id])
        return channel
    end
end

class ApplicationController < ActionController::Base
    helper_method :logged?
    def logged?
        session[:channel_id].present?

    end 
end

class FeedController < ApplicationController

    def index
        @videos = Video.all
        puts"***************************************************"
        puts @videos
    end
end 
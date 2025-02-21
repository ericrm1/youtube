class SearchController < ApplicationController
  def search
    query = params[:prompt]
    @videos = Video.joins(:channel)
                  .where("videos.title LIKE ? OR channels.name LIKE ?", "%#{query}%", "%#{query}%")
  end
end

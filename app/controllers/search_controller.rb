class SearchController < ApplicationController
  def search
    query = params[:prompt]
    @videos = Video.where("title LIKE?", "%#{query}%")
  end
end

class FeedsController < ApplicationController

  def index
    @feeds = Feed.all
  end

  def show
    @feed = Feed.includes(:episodes).order('episodes.published_at' => :desc).find(params[:id])
  end

end

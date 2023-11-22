class FeedsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feeds = Feed.all
    @subscribed = current_user.feeds.all
  end

  def show
    # @feed = current_user.feeds.includes(:episodes).order('episodes.published_at' => :desc).find(params[:id])
    @feed = Feed.includes(:episodes).order('episodes.published_at' => :desc).find(params[:id])
  end

end

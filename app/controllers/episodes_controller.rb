class EpisodesController < ApplicationController

  def show
    @episode = Episode.includes(:feed).find_by(id: params[:id], feed_id: params[:feed_id])
    @feed = @episode.feed
  end

end

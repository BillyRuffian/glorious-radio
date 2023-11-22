class EpisodesController < ApplicationController
  before_action :authenticate_user!

  def show
    @episode = Episode.includes(:feed).find_by(id: params[:id], feed_id: params[:feed_id])
    @feed = @episode.feed
    # render partial: 'audio_player' if turbo_frame_request?
  end

  def play
    @episode = Episode.includes(:feed).find_by(id: params[:episode_id], feed_id: params[:feed_id])
    @feed = @episode.feed
    render 'audio_player'
  end

end

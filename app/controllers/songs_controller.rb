class SongsController < ApplicationController
  def index
      @songs = Song.all
  end

  def create
      @song = Song.new(song_params)
      if @song.save
          redirect_to '/songs'
      else
          redirect_to '/songs', alert: @song.errors.full_messages
      end
  end

  def show
      @song = Song.find(params[:id])
  end

  private
  def song_params
      params.require(:song).permit(:artist, :title)
  end
end

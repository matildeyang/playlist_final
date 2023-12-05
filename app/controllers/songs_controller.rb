class SongsController < ApplicationController
  def index
    matching_songs = Song.all

    @list_of_songs = matching_songs.order({ :created_at => :desc })

    render({ :template => "songs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_songs = Song.where({ :id => the_id })

    @the_song = matching_songs.at(0)

    render({ :template => "songs/show" })
  end

  def create
    the_song = Song.new
    the_song.title = params.fetch("query_title")
    the_song.artist_name = params.fetch("query_artist_name")

    if the_song.valid?
      the_song.save
      redirect_to("/songs", { :notice => "Song created successfully." })
    else
      redirect_to("/songs", { :alert => the_song.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_song = Song.where({ :id => the_id }).at(0)

    the_song.title = params.fetch("query_title")
    the_song.artist_name = params.fetch("query_artist_name")

    if the_song.valid?
      the_song.save
      redirect_to("/songs/#{the_song.id}", { :notice => "Song updated successfully."} )
    else
      redirect_to("/songs/#{the_song.id}", { :alert => the_song.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_song = Song.where({ :id => the_id }).at(0)

    the_song.destroy

    redirect_to("/songs", { :notice => "Song deleted successfully."} )
  end
end

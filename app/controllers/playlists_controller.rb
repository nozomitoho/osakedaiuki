class PlaylistsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def new
        @playlist = Playlist.new

    end

    def create
        playlist = Playlist.new(playlist_params)
        playlist.user_id = current_user.id

        if playlist.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def index
        @playlists = Playlist.all
    end

    def show
        @playlist = Playlist.find(params[:id])
        @games = @playlist.games.order(:rank)
        @randam_games = @playlist.games.order("RAND()")
        @randam_games2 = @playlist.games
    end

    def edit
        @playlist = Playlist.find(params[:id])
    end

    def update
        playlist = Playlist.find(params[:id])

        @playlistgames = playlistgames_params.keys.each do |id|
            playlistgame = Playlistgame.find(id)
            playlistgame.update_attributes(playlistgames_params[id])
            playlistgame
        end

        if playlist.update(playlist_params)
            redirect_to :action => "show", :id => playlist.id
        else
            redirect_to :action => "new"
        end
    end

    def delete
        playlist = Playlist.find(params[:id])
        playlist.destroy
        redirect_to action: :index
    end

    private
    def playlist_params
        params.require(:playlist).permit(:content, {:game_ids => []})
    end

    def playlistgames_params
        params.permit(playlistgames: [:rank])[:playlistgames]
    end
end

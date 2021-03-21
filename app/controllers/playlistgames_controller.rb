class PlaylistgamesController < ApplicationController

    #特定のプレイリストから特定の曲を削除するときに使う。曲のレコードは消えないで、中間テーブルにレコードが飛ぶ。
    def destroy
        playlistgame = Playlistgame.find_by(playlist_id: params[:playlist_id], game_id: params[:id])
        playlistgame.destroy
        redirect_back(fallback_location: root_path)
      end
end

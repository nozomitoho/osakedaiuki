class GamesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def top
    end
    def app
    end
    
    def index
        if params[:search] == nil
            @game= Game.all.order(id: "DESC").page(params[:page]).per(3)
        elsif params[:search] == ''
            @game= Game.all.order(id: "DESC").page(params[:page]).per(3)
        else
            #部分検索
            @game = Game.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
        end

        #ランキング表示(3位まで)
        @rank_games = Game.all.sort {|a,b| b.playlists.count <=> a.playlists.count}.first(3)

    end
    def show
        @game = Game.find(params[:id])
    end
    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)
        @game.user_id = current_user.id

        #youtube表示
        url = params[:game][:youtube_url]
        url = url.last(11)
        @game.youtube_url = url
        #ここまで

        if @game.save
            #投稿後メッセ
            flash[:notice] = '飲み歌が追加されました。'
            redirect_to :action => "index"
        else
            #投稿失敗メッセ
            flash.now[:alert] = '投稿失敗。タメ１です。'
            redirect_to :action => "new"
        end
    end

    def edit
        @game = Game.find(params[:id])
    end

    def update
        game = Game.find(params[:id])
        if game.update(game_params)
            redirect_to :action => "show", :id => game.id
        else
            redirect_to :action => "new"
        end
    end
    
    def destroy
        game = Game.find(params[:id])
        game.destroy
        redirect_to action: :index
    end



    private
    def game_params
        params.require(:game).permit(:body, :title)
    end
end

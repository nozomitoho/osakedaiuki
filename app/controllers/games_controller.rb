class GamesController < ApplicationController
    def index
        if params[:search] == nil
            @game= Game.all.page(params[:page]).per(3)
        elsif params[:search] == ''
            @game= Game.all.page(params[:page]).per(3)
        else
            #部分検索
            @game = Game.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
        end
    end
    def show
        @game = Game.find(params[:id])
    end
    def new
        @game = Game.new
    end

    def create
        game = Game.new(game_params)
        game.user_id = current_user.id
        if game.save
            redirect_to :action => "index"
        else
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
        params.require(:game).permit(:body)
    end
end

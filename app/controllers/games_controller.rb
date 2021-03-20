class GamesController < ApplicationController
    def index
        @game = Game.all
    end
    def show
        @game = Game.find(params[:id])
    end
    def new
        @game = Game.new
    end

    def create
        game = Game.new(game_params)
        if game.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    
    private
    def game_params
        params.require(:game).permit(:body)
    end
end

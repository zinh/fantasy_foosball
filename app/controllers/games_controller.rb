class GamesController < ApplicationController
  def show
    get_game
  end

  def new
    @game = Game.new
    @match = Match.find(params[:match_id])
  end

  def create
    get_match
    @game = Game.new(game_params)
    @game.match_id = @match.id
    if @game.save
      flash.notice = "Game created"
      redirect_to match_path(@match)
    else
      flash.now[:message] = "Error create game"
      render :new
    end
  end

  def edit
    get_game
    get_match
    render :new
  end

  def update
    get_game
    get_match
    if @game.update_attributes(game_params)
      flash.notice = "Game updated"
      redirect_to match_path(@match)
    else
      flash.now[:message] = "Error update game"
      render :new
    end
  end

  private
  def get_game
    @game = Game.find(params[:id])
  end

  def get_match
    @match = Match.find(params[:match_id])
  end

  def game_params
    params.require(:game).permit(:score, :winning_team_id)
  end
end

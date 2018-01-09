class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    get_match
  end

  def new
    @match = Match.new
    @match.team_matches << TeamMatch.new
    @match.team_matches << TeamMatch.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash[:success] = "Match created successfully"
      redirect_to match_path(@match)
    else
      flash.now[:danger] = "Error create match"
      render :new
    end
  end

  def edit
    get_match
  end

  def update
    get_match
  end

  private
  def get_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(team_matches_attributes: [:team_id])
  end
end

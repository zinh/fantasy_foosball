class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    get_team
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save?
    else
    end
  end

  def edit
    get_team
  end

  def update
    get_team
  end

  private
  def get_team
    @team = Team.find(params[:id])
  end
end

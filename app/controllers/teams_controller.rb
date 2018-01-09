class TeamsController < ApplicationController
  def top
    @teams = Team.all
  end

  def index
    @teams = Team.all
  end

  def show
    get_team
  end

  def new
    @team = Team.new
    @team.user_teams << UserTeam.new
    @team.user_teams << UserTeam.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash.notice = "Team #{@team.name} created"
      redirect_to team_path(@team)
    else
      if @team.user_teams.size.zero?
        @team.user_teams << UserTeam.new
        @team.user_teams << UserTeam.new
      end
      flash.now[:message] = "Error create team"
      render :new
    end
  end

  def edit
    get_team
  end

  def update
    get_team
    if @team.update_attributes(team_params)
      flash.notice = "Team #{@team.name} updated"
      redirect_to team_path(@team)
    else
      flash.now[:message] = "Error update team"
      render :edit
    end
  end

  private
  def get_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, user_teams_attributes: [ :id, :user_id ])
  end
end

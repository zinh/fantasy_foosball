class TeamsController < ApplicationController
  def top
    @stat = Match.winning_stat
    @teams = Team.all
      .sort_by{ |team| team.matches_counter.nonzero? ? (@stat[team.id] || 0) / team.matches_counter : 0 }
      .reverse
    render :index
  end

  def index
    @teams = Team.all
    @stat = Match.winning_stat
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
      flash[:success] = "Team #{@team.name} created"
      redirect_to team_path(@team)
    else
      if @team.user_teams.size < Team::MAX_MEMBER
        (Team::MAX_MEMBER - @team.user_teams.size).times{ @team.user_teams << UserTeam.new }
      end
      flash.now[:danger] = "Error create team"
      render :new
    end
  end

  def edit
    get_team
    if @team.user_teams.size < Team::MAX_MEMBER
      (Team::MAX_MEMBER - @team.user_teams.size).times{ @team.user_teams << UserTeam.new }
    end
  end

  def update
    get_team
    if @team.update_attributes(team_params)
      flash[:success] = "Team #{@team.name} updated"
      redirect_to team_path(@team)
    else
      flash.now[:danger] = "Error update team"
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

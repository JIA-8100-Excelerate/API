class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :update, :destroy]

  # GET /goals
  def index
    if params[:mentee] and current_user.mentees.include?(params[:mentee])
      @goals = User.find_by(email: params[:mentee]).goals
    else
      @goals = current_user.goals
    end

    json_response(@goals)

    # if !current_user&.mentee.nil?
    #   mentee = User.find_by(email: current_user.mentees[0])
    #   @goals = mentee.goals
    # else
    #   @goals = current_user.goals
    # end
  end

  # POST /goals
  def create
    @goal = current_user.goals.create!(goal_params)
    json_response(@goal, :created)
  end

  # GET /goals/:id
  def show
    json_response(@goal)
  end

  # PUT /goals/:id
  def update
    @goal.update(goal_params)
    head :no_content
  end

  # DELETE /goals/:id
  def destroy
    @goal.destroy
    head :no_content
  end

  private

  def goal_params
    params.permit(:category, :complete)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end

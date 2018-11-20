class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :update, :destroy]

  # GET /goals
  def index
    if current_user.mentees != []
      @goals = {}
      current_user.mentees.each do |email|
        mentee = User.find_by(email: email)
        if !mentee.nil?
          mentee_goals = mentee.goals
          if !mentee_goals.nil?
            @goals[email] = mentee_goals
          else
            @goals[email] = []
          end
        end
      end
    else
      @goals = current_user.goals
    end

    json_response(@goals)
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

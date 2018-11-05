class CompletedTasksController < ApplicationController
  before_action :set_goal
  before_action :set_goal_task, only: [:show, :update, :destroy]

  # GET /goals/:goal_id/completed_tasks
  def index
    json_response(@goal.completed_tasks)
  end

  # GET /goals/:goal_id/completed_tasks/:id
  def show
    json_response(@task)
  end

  # POST /goals/:goal_id/completed_tasks
  def create
    @goal.completed_tasks.create!(completed_task_params)
    json_response(@goal, :created)
  end

  # PUT /goals/:goal_id/completed_tasks/:id
  def update
    @task.update(completed_task_params)
    head :no_content
  end

  # DELETE /goals/:goal_id/completed_tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end

  private

  def completed_task_params
    params.permit(:name)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_goal_task
    @task = @goal.completed_tasks.find_by!(id: params[:id]) if @goal
  end
end

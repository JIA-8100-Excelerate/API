class TasksController < ApplicationController
  before_action :set_goal
  before_action :set_goal_task, only: [:show, :update, :destroy]

  # GET /goals/:goal_id/tasks
  def index
    json_response(@goal.tasks)
  end

  # GET /goals/:goal_id/tasks/:id
  def show
    json_response(@task)
  end

  # POST /goals/:goal_id/tasks
  def create
    @goal.tasks.create!(task_params)
    json_response(@goal, :created)
  end

  # PUT /goals/:goal_id/tasks/:id
  def update
    @task.update(task_params)
    head :no_content
  end

  # DELETE /goals/:goal_id/tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.permit(:name)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_goal_task
    @task = @goal.tasks.find_by!(id: params[:id]) if @goal
  end
end

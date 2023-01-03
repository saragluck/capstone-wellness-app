class GoalsController < ApplicationController
  before_action :authenticate_user

  def create
    goal = Goal.create(
      user_id: current_user.id,
      goal: params[:goal],
      category: params[:category],

    )
    render json: goal.as_json
  end

  #Index action
  def index
    goals = Goal.all
    render json: goals.as_json
  end

  #Show action
  def show
    goal = Goal.find_by(id: params[:id])
    render json: goal.as_json
  end

  #Update action
  def update
    goal = Goal.find_by(id: params[:id])
    goal.update(
      goal: params[:goal] || goal.goal,
      category: params[:category] || goal.category,
    )
    render json: goal.as_json
  end

  #destroy action
  def destroy
    goal = Goal.find_by(id: params[:id])
    goal.destroy
    render json: { message: "goal destroyed" }
  end
end

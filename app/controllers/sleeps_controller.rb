class SleepsController < ApplicationController
  before_action :authenticate_user

  #Create action
  def create
    sleep = Sleep.create(
      user_id: current_user.id,
      asleep: params[:asleep],
      awake: params[:awake],
      date: params[:date],
    )
    render json: sleep.as_json
  end

  #Index action
  def index
    sleeps = Sleep.all
    render json: sleeps.as_json
  end

  #Show action
  def show
    sleep = Sleep.find_by(id: params[:id])
    render json: sleep.as_json
  end

  #Update action
  def update
    sleep = Sleep.find_by(id: params[:id])
    sleep.update(
      asleep: params[:asleep] || sleep.asleep,
      awake: params[:awake] || sleep.awake,
      date: params[:date] || sleep.date,
    )
    render json: sleep.as_json
  end

  #destroy action
  def destroy
    sleep = Sleep.find_by(id: params[:id])
    sleep.destroy
    render json: { message: "Sleep destroyed" }
  end
end

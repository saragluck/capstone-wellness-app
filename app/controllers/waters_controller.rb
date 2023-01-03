class WatersController < ApplicationController
  before_action :authenticate_user

  def create
    water = Water.create(
      user_id: current_user.id,
      time: params[:time],
      date: params[:date],
      amount: params[:amount],
    )
    render json: water.as_json
  end

  #Index action
  def index
    waters = current_user.waters.all
    render json: waters.as_json
  end

  #Show action
  def show
    water = current_user.waters.find_by(id: params[:id])
    render json: water.as_json
  end

  #Update action
  def update
    water = current_user.waters.find_by(id: params[:id])
    water.update(
      time: params[:time] || water.time,
      date: params[:date] || water.date,
      amount: params[:amount] || water.amount,
    )
    render json: water.as_json
  end

  #destroy action
  def destroy
    water = current_user.waters.find_by(id: params[:id])
    water.destroy
    render json: { message: "water destroyed" }
  end
end

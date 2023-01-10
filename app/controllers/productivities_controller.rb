class ProductivitiesController < ApplicationController
  before_action :authenticate_user

  def create
    productivity = Productivity.create(
      user_id: current_user.id,
      level: params[:level],
      time: params[:time],
      date: params[:date]

    )
    render json: productivity.as_json
  end

  #Index action
  def index
    productivities = current_user.productivities.all
    render json: productivities.as_json
  end

  #Show action
  def show
    productivity = current_user.productivities.find_by(id: params[:id])
    render json: productivity.as_json
  end

  #Update action
  def update
    productivity = current_user.productivities.find_by(id: params[:id])
    productivity.update(
      level: params[:level] || productivity.level, 
      time: params[:time] || productivity.time, 
      date: params[:date] || productivity.date
    )
    render json: productivity.as_json
  end

  #destroy action
  def destroy
    productivity = current_user.productivities.find_by(id: params[:id])
    productivity.destroy
    render json: { message: "productivity destroyed" }
  end
end

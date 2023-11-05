class SleepsController < ApplicationController
  include ActionController::Live
  before_action :authenticate_user


  #The create action
  def create
    
    
    sleep = Sleep.new(
      user_id: current_user.id,
      asleep: params[:asleep],
      awake: params[:awake],
      date: params[:date]
    )
    
    if sleep.save
      render json: sleep.as_json
    else
      render json: { message: "missing stuff" }
    end
    
    # SleepsChannel.broadcast_to(sleep, { event: 'update' })
    # broadcast sleep
  end
  
  #Index action
  def index
    sleeps = current_user.sleeps
    render json: sleeps.as_json
  end

  #Show action
  def show
    sleep = current_user.sleeps.find_by(id: params[:id])
    render json: sleep.as_json
  end

  #Update action
  def update
    sleep = current_user.sleeps.find_by(id: params[:id])
    sleep.update(
      asleep: params[:asleep] || sleep.asleep,
      awake: params[:awake] || sleep.awake,
      date: params[:date] || sleep.date,
    )
    render json: sleep.as_json
    # SleepsChannel.broadcast_to(sleep, { event: 'update' })
    # broadcast sleep
  end

  #destroy action
  def destroy
    sleep = current_user.sleeps.find_by(id: params[:id])
    sleep.destroy
    render json: { message: "Sleep destroyed" }
    # SleepsChannel.broadcast_to(sleep, { event: 'update' })
    # broadcast sleep
  end
end

# private

# def broadcast(sleep)
#   # ActiveModelSerializers::SerializableResource.new(object).as_json
#   # returns the same thing sent by render json: object
#   SleepsChannel.broadcast_to(sleep, ActiveModelSerializers::SerializableResource.new(sleep).as_json)
# end
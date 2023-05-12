class SleepsController < ApplicationController
  include ActionController::Live
  before_action :authenticate_user


  #The create action
  def create
    
    sleep = Sleep.create!(
      user_id: current_user.id,
      asleep: params[:asleep],
      awake: params[:awake],
      date: params[:date],
    )
    
    render json: sleep.as_json
  end
  
  #Index action
  def index
    sleeps = current_user.sleeps
    render json: sleeps.as_json
    
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, event: 'time')
    begin
      loop do
        sse.write({ :time => Time.now })
        sleep 1
      end
    rescue ClientDisconnected
    ensure
      sse.close
    end
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
  end

  #destroy action
  def destroy
    sleep = current_user.sleeps.find_by(id: params[:id])
    sleep.destroy
    render json: { message: "Sleep destroyed" }
  end
end

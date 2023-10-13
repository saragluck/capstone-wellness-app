class SleepsController < ApplicationController
  include ActionController::Live
  before_action :authenticate_user

  # defines sse action

  # def sse
  #     # Set the response headers to show it is SSE
  #     response.headers["Content-Type"] = "text/event-stream"

  #     # Create an SSE object that frontend will listen for
  #     sse = SSE.new(response.stream, event: "sleepData")
  
  #     # Subscribe to sleep data channel
  #     sleep_data_channel.subscribe do |message|
  #       # Write the received message to the SSE connection
  #       sse.write(message.to_json)
  #     end
  
  #     # Keep the SSE connection open until closed by the client or server
  #     rescue ClientDisconnected
  #     ensure
  #       # Close the SSE connection and unsubscribe from the sleep data channel
  #       sse.close
  #       sleep_data_channel.unsubscribe
  #     end
  # end

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

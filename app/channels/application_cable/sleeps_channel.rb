class SleepsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    sleep = Sleep.find(params[:sleep_id])
    stream_for sleep
  end

  def unsubscribed
    stop_all_streams
  end
end
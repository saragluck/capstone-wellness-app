class SleepsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from 'SleepsChannel'
  end

  def unsubscribed
    stop_all_streams
  end
end

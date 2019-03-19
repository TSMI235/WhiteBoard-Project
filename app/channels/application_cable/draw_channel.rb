class DrawChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'drawing'
  end
end
class CloudComputing < ApplicationRecord
  attr_accessor :timestamp, :payload, :execution_delay

  def initialize(model_params)
    @id = model_params[:id]
    @timestamp = Time.now
    @payload = (0...model_params[:payload_size]).map {
      char_type = rand(1..3)
      case char_type
        when 1
          ('a'..'z').to_a[rand(26)]
        when 2
          ('A'..'Z').to_a[rand(26)]
        else
          ('0'..'9').to_a[rand(9)]
      end
    }.join
    @execution_delay = (@timestamp.to_f - Time.now.to_f).abs

  end
end

class CloudComputingController < ApplicationController

  # POST Content-Type: application/json
  def create
    @cloud_computing = CloudComputing.new(cloud_computing_params)
    render json: @cloud_computing
  end


  private

  # Only allow a trusted parameter "white list" through.
  def cloud_computing_params
    params.require(:cloud_computing).permit(:id, :payload_size)
  end
end

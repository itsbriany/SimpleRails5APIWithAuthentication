class ApiController < ApplicationController
  def index
    @stuff = 'stuff!!!'

    render json: @stuff
  end

  def show
    render json: @stuff
  end
end

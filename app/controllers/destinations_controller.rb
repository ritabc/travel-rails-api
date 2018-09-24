class DestinationsController < ApplicationController
  def index
    city = params[:city]
    country = params[:country]
    @destinations = Destination.search_by_place(city, country)
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination = Destination.create!(destination_params)
    json_response(@destination, :created)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      render status: 200, json: {
        message: "Your destination has been updated successfully."
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
  end

private

  def destination_params
    params.permit(:country, :city, :description)
  end
end

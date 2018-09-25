class ExcursionsController < ApplicationController
  def index
    activity_id = params[:activity_id]
    destination_id = params[:destination_id]
    season = params[:season]
    price = params[:price]
    @excursions = Excursion.search_by_activity_id(activity_id).search_by_destination_id(destination_id).search_by_price(price).search_by_season(season)
    json_response(@excursions)
  end

  def show
    @excursion = Excursion.find(params[:id])
    json_response(@excursion)
  end

  def create
    @excursion = Excursion.create!(excursion_params)
    json_response(@excursion, :created)
  end

  def update
    @excursion = Excursion.find(params[:id])
    if @excursion.update(excursion_params)
      render status: 200, json: {
        message: "Your excursion has been updated successfully."
      }
    end
  end

  def destroy
    @excursion = Excursion.find(params[:id])
    @excursion.destroy
  end

private

  def excursion_params
    params.permit(:activity_id, :destination_id, :season, :description, :price)
  end
end

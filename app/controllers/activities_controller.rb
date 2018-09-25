class ActivitiesController < ApplicationController

  def index
    id = params[:id]
    name = params[:name]
    @activities = Activity.search_by_name(name).search_by_id(id)
    json_response(@activities)
  end

  def show
    @activity = Activity.find(params[:id])
    json_response(@activity)
  end

  def create
    @activity = Activity.create!(activity_params)
    json_response(@activity, :created)
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      render status: 200, json: {
        message: "Your activity has been updated successfully."
      }
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

private

  def activity_params
    params.permit(:name)
  end
end

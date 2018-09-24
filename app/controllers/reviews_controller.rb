class ReviewsController < ApplicationController

  def index
    user_id = params[:user_id]
    destination_id = params[:destination_id]
    @reviews = Review.search_by_user(user_id).search_by_destination(destination_id).all
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      render status: 200, json: {
        message: "Your review has been updated successfully."
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

private

  def review_params
    params.permit(:content, :rating, :destination_id, :user_id)
  end
end

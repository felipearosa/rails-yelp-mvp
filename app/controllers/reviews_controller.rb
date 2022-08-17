class ReviewsController < ApplicationController

  # def index
  #   @restaurant = Restaurant.find(restaurant_id = id)
  #   @reviews = Review.where(restaurant_id = @restaurant.id)
  # end

  # def new
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])

    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render 'restaurants/show', status: :unprocessable_entity
    end

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

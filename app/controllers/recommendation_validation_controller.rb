class RecommendationValidationController < ApplicationController
  def create
    restaurant_recommendation = nil
    if params[:recommendation_validation] and
      restaurant_recommendation =
        RestaurantRecommendation.find(params[:restaurant_recommendation_id])

      restaurant_recommendation.recommendation_validations.create(
        recommendation_validation_params)
      redirect_to restaurant_recommendation_path params[
        :restaurant_recommendation_id]
    else
      redirect_to restaurant_recommendation_path params[
        :restaurant_recommendation_id]
    end
  end

  def recommendation_validation_params
      params.require(:recommendation_validation).permit(:valid_recommendation,
        :time_of_entry, :time_to_complete, :worker_id, :hit_id, :assignment_id)
  end
end

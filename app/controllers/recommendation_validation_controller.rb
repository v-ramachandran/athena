require "modules/mechanical_turk/url_factory"

class RecommendationValidationController < ApplicationController
  include MechanicalTurk::URLFactory

  def create
    restaurant_recommendation = nil
    if params[:recommendation_validation] and
      restaurant_recommendation =
        RestaurantRecommendation.find(params[:restaurant_recommendation_id])

      submission_params = recommendation_validation_params
      restaurant_recommendation.recommendation_validations.create(
        submission_params)
      redirect_to construct_task_submission_url assignment_id=submission_params[:assignment_id],
        worker_id=submission_params[:worker_id], hit_id=submission_params[:hit_id]
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

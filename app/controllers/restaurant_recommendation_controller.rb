require "modules/mechanical_turk/url_factory"

class RestaurantRecommendationController < ApplicationController
  include MechanicalTurk::URLFactory

  def new
    @tags=["is vegetarian","is italian","has pasta"]
    @location_city="Austin"
    @location_state="Texas"
    @location_country="USA"
  end

  def show
    @restaurant_recommendation =
      RestaurantRecommendation.find_by_id params[:id]
  end

  def create
    if params[:restaurant_recommendation]
      submission_params = restaurant_recommendation_params
      id = RestaurantRecommendation.create submission_params
      redirect_to construct_task_submission_url assignment_id=submission_params[:assignment_id],
        worker_id=submission_params[:worker_id], hit_id=submission_params[:hit_id]
    else
      redirect_to new_restaurant_recommendation_path
    end
  end

  def show_groups
    minimum_frequency = params[:minimum_frequency] || 0
    @groups = RestaurantRecommendation.find_groups_with_atleast_min_count minimum_frequency
    render json: @groups.keys
  end

  def restaurant_recommendation_params
      params.require(:restaurant_recommendation).permit(:name, :time_to_complete,
        :time_of_entry, :serialized_terms, :city, :state, :country, :hit_id,
	      :assignment_id, :worker_id)
  end
end

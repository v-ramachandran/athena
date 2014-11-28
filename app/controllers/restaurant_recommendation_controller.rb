class RestaurantRecommendationController < ApplicationController
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
      id = RestaurantRecommendation.create restaurant_recommendation_params
      redirect_to restaurant_recommendation_path id
    else
      redirect_to new_restaurant_recommendation_path
    end
  end

  def restaurant_recommendation_params
      params.require(:restaurant_recommendation).permit(:name, :time_to_complete,
        :time_of_entry, :serialized_terms, :city, :state, :country, :hit_id,
	      :assignment_id, :worker_id)
  end
end

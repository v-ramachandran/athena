class RestaurantRecommendationController < ApplicationController
  def new
    @tags=["vegetarian","italian"]
    @location_city="Austin"
    @location_state="Texas"
    @location_country="USA"
  end

  def create
    if params[:restaurant_recommendation] 
      RestaurantRecommendation.create restaurant_recommendation_params
      redirect_to new_restaurant_recommendation_path
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

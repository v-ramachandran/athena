class RestaurantRecommendation < ActiveRecord::Base
  has_many :recommendation_validations
end

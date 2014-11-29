class RestaurantRecommendation < ActiveRecord::Base
  has_many :recommendation_validations

  def self.find_groups_with_atleast_min_count min_count
    RestaurantRecommendation.all.group(:name).having("count(*) > #{min_count}").
      count
  end
end

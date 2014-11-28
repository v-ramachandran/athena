class RenameValidToValidRecommendation < ActiveRecord::Migration
  def change
    rename_column :recommendation_validations, :valid, :valid_recommendation
  end
end

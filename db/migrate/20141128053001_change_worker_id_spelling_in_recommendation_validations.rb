class ChangeWorkerIdSpellingInRecommendationValidations < ActiveRecord::Migration
  def change
    rename_column :recommendation_validations, :worked_id, :worker_id
  end
end

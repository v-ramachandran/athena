Rails.application.routes.draw do

  get 'restaurant_recommendation/show_groups',
    as: 'restaurant_recommendation_show_groups_path'

  resources :restaurant_recommendation, only: [:new, :show, :create] do
    resources :recommendation_validation, only: [:create]
  end

end

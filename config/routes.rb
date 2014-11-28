Rails.application.routes.draw do

  resources :restaurant_recommendation, only: [:new, :show, :create] do
    resources :recommendation_validation, only: [:create]
  end
end

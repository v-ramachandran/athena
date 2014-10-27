Rails.application.routes.draw do
  get 'restaurant_recommendation/new', as: 'new_restaurant_recommendation'
  post 'restaurant_recommendation/create', as: 'create_restaurant_recommendation'
end

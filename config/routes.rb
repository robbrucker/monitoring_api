Rails.application.routes.draw do
  resources :category_records
  resources :users
  resources :categories
  get "last_details/:user_id" => "category_records#last_details"
  get "todays_records/:user_id/:category_id" => "category_records#todays_details"
  post  "/login"       => "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

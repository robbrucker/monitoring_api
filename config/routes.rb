Rails.application.routes.draw do
  resources :timer_tags
  resources :category_record_tags
  resources :tags
  resources :category_records
  resources :users
  resources :categories
  resources :tags
  resources :category_tags
  resources :timer_tags
  get "category_tag_search/:user_id/:category_id/:search_term" => "category_tags#fuzzy_search"
  get "last_details/:user_id" => "category_records#last_details"
  get "todays_records/:user_id/:category_id" => "category_records#todays_details"
  post  "/login"       => "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

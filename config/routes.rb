Rails.application.routes.draw do
  resources :search_suggestions
  root 'static_pages#index'
  resources :acronyms do
    collection { post :import }
  end

get '/instructions', to: 'static_pages#instruction', as: 'instructions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

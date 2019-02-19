Rails.application.routes.draw do
  
  resources :questionnaires, shallow: true do
    resources :questions do
      resources :choices
    end
  end

  resources :users, only: [:index, :show]
  resources :quizzes

  get 'home/index'
  root 'home#index'

  get "/login", to: redirect("/auth/google_oauth2")
  get "/logout", to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#create"
  resource :session, only: [:create, :destroy]

  # resources :answers


end

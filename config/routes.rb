Rails.application.routes.draw do
  resources :answers
  resources :quizzes
  resources :choices
  resources :questions
  resources :questionnaires
  resources :users, only: [:index, :show]
  get 'home/index'
  root 'home#index'

  get "/login", to: redirect("/auth/google_oauth2")
  get "/logout", to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#create"

  resource :session, only: [:create, :destroy]

end

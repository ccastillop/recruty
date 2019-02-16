Rails.application.routes.draw do
  get 'home/index'
  root 'welcome#index'
end

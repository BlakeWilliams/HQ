HQ::Application.routes.draw do
  resources :projects
  resources :issues

  root to: "home#index"
end

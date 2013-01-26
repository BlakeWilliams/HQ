HQ::Application.routes.draw do
  resources :projects
  root to: "home#index"
end

JsViews::Application.routes.draw do
  resources :dogs
  root 'dogs#index'
end

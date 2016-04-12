Rails.application.routes.draw do
  resources :links
  get '/:id' => 'links#show'
  get '/report' => 'links#index'

  root 'links#new'
end

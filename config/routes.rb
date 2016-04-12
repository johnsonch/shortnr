Rails.application.routes.draw do
  resources :links, only: [:index, :show, :create, :new]
  get '/:id' => 'links#show'
  get '/report' => 'links#index'

  root 'links#new'
end

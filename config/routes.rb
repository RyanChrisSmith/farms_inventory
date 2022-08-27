Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/animals', to: 'animals#index'
  get '/farms', to: 'farms#index'
  get '/farms/new', to: 'farms#new'
  get '/animals/:id', to: 'animals#show'
  get '/farms/:id', to: 'farms#show'
  get '/farms/:farm_id/animals/new', to: 'animals#new'
  get '/farms/:farm_id/animals', to: 'farm_animals#index'
  post '/farms', to: 'farms#create'
  get '/farms/:id/edit', to: 'farms#edit'
  patch '/farms/:id', to: 'farms#update'
  post '/animals', to: 'animals#create'
  get '/animals/:id/edit', to: 'animals#edit'
  patch '/animals/:id', to: 'animals#update'
  get '/farms/:id/animals/:id/edit', to: 'animals#edit'
  delete '/farms/:id', to: 'farms#destroy'
  delete '/animals/:id', to: 'animals#destroy'
end

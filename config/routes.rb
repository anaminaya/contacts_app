Rails.application.routes.draw do
  get '/contact' => 'contacts#index'
  get '/contact/new' => 'contacts#new'
  post '/contact' => 'contacts#create'
  get '/contact/:id' => 'contacts#show'
  get '/contact/:id/edit' => 'contacts#edit'
  patch '/contact/:id' => 'contacts#update'
  delete '/contact/:id' => 'contacts#destroy'
end

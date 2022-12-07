Rails.application.routes.draw do
  resources :cars
  resources :reservation, only: [:index, :create]
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
    root "cars#index"
     
end

Rails.application.routes.draw do
  resources :cars
  resources :reservations, only: [:index, :create, :show]
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
    root "cars#index"
     
end

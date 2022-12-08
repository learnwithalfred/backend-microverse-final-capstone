Rails.application.routes.draw do
  resources :cars, except: %i[new edit]
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
    root "cars#index"
     
end

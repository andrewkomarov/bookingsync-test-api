Rails.application.routes.draw do
  resources :bookings
  resources :rentals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match 'unauthorized' => 'application#unauthorized', :via => :all

end

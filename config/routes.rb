Rails.application.routes.draw do
  resources :shipping_rates, :only => [:index]
end

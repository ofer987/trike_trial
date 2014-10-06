Rails.application.routes.draw do
  resources :countries, :only => [] do
    get :shipping_rates, :on => :collection
  end
end

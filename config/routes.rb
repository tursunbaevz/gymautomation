Rails.application.routes.draw do
  resources :solds
  resources :categories
  resources :products
  resources :payments
  resources :form_of_payments
  resources :gyms

  resources :customers
 	root 'customers#new'


 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

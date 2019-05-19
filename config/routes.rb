Rails.application.routes.draw do
  devise_for :users, controllers: {passwords: 'users/passwords', sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'dash_board#splash'
  get    '/dash',   to: 'dash_board#new'
  #get    '/contacts_page', to: 'dash_board#contacts'
  get    '/payment_page', to: 'dash_board#payment'
  get    '/orders_page', to: 'order#orders_page'
  get    '/profile', to: 'users#edit'
  get    '/admin', to: 'admin#admin'
  match   'properties/add/:id', to: 'properties#add', :via => :get, :as => :add_order
  get    'view_checkout', to: "order#view"
  post   'checkout', to: "order#checkout"
  post    'paypal', to: "order#paypal"
  get    'order/new', to: "order#new"
  match   'order/cancel/:id', to: 'order#cancel', :via => :get, :as => :cancel
  match  '/update_order/:id', to: 'admin#update_order', :via => :put, :as => :update_order
  match  '/admin/edit_order/:id', to: 'admin#edit_order', :via => :get, :as => :edit_order
  #match   'order/checkout', to: 'order#checkout', :via => :post, :as => :checkout
  resources:properties
  resources :authentications, only: [:destroy]

  # match ':not_found' => 'properties#error',
  # :constraints => { :not_found => /.*/ }, :via => :get

end

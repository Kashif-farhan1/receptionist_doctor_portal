Rails.application.routes.draw do
  # Routes for patient data
  
  resources :patients, only: [:index]

  # Routes for receptionists' authentication and registration
  devise_for :receptionists, controllers: {
    registrations: 'receptionists/registrations'
  }

  # Routes for doctors' authentication and registration
  devise_for :doctors, controllers: {
    registrations: 'doctors/registrations'
  }

  # Define root routes for authenticated users
  authenticated :receptionist do
    root 'receptionists#dashboard', as: :authenticated_receptionist_root
  end

  authenticated :doctor do
    root 'doctors#dashboard', as: :authenticated_doctor_root
  end

  # Default root route redirects to login page
  root 'sessions#new'

  # Routes for receptionists and doctors registration
  get 'receptionists/registration/new', to: 'receptionists_registration#new'
  post 'receptionists/registration/create', to: 'receptionists_registration#create'
  get 'doctors/registration/new', to: 'doctors_registration#new'
  post 'doctors/registration/create', to: 'doctors_registration#create'

  # Session routes for login and logout
  get '/login', to: 'sessions#new'
  get '/patients/other_page', to: 'patients#show_other_page'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Routes for receptionists and doctors resources
  resources :receptionists, only: [:new, :create]
  resources :doctors, only: [:new, :create]

  # Nested routes within namespaces for receptionists and doctors
  namespace :receptionists do
    resources :sessions, only: [:new, :create, :destroy]
    resources :patients
    get 'dashboard', to: 'dashboard#index'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'registration', to: 'registrations#new'
    post 'registration', to: 'registrations#create'
  end

  namespace :doctors do
    resources :patients, only: [:index] 
    resources :sessions, only: [:new, :create, :destroy]
    resources :patients do
      get 'graph', on: :collection
    end
    get 'dashboard', to: 'dashboard#index'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'registration', to: 'registrations#new'
    post 'registration', to: 'registrations#create'
  end
end

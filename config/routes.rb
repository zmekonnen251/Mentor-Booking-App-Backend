Rails.application.routes.draw do
  devise_for :mentors,controllers: { 
    registrations: 'api/v1/mentors/registrations',
    sessions: 'api/v1/mentors/sessions',
  }

  devise_for :users,controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  }
  
  post 'technologies', to: 'api/v1/technologies#create'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

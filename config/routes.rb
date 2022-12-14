Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users,controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  }
  
  post '/mentor-request', to: 'api/v1/mentors/mentors#create'
  post '/technologies', to: 'api/v1/technologies#create'
  get '/mentors/list', to: 'api/v1/mentors/mentors#index'
  put '/approve_mentor/:id', to: 'api/v1/mentors/mentors#approve_mentor'
  put '/ban_mentor', to: 'api/v1/mentors/mentors#ban_mentor'
  delete '/remove_mentor/:id', to: 'api/v1/mentors/mentors#remove_mentor'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/reservations', to: 'api/v1/bookings#reservations'
  delete '/cancel_reservation/:id', to: 'api/v1/bookings#cancel_reservation'
  post '/reserve', to: 'api/v1/bookings#reserve'
  # Defines the root path route ("/")
  # root "articles#index"
end

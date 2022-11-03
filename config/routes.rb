Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "lists#index"
  # resources :lists
  resources :corps do
    resources :resumes do
      resources :cards
    end
  end

  resources :ques
  resources :events 
    
  # get '/lists/:resume_id', to: 'lists#index'
  get '/lists', to: 'lists#index'
  get '/lists/list', to: 'lists#list'
  get '/lists/formque', to: 'lists#formque'
  get '/lists/formcorp', to: 'lists#formcorp'
  get '/lists/resumecards', to: 'lists#resumecards'
  get '/lists/quecards', to: 'lists#quecards'
  get '/lists/corpcards', to: 'lists#corpcards'
end
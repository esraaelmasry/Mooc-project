Rails.application.routes.draw do
  get 'lectures/download'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'control/login'
  root "control#login"
 
  resources :lectures do
  resources :comments
    member do
    put "like", to: "lectures#upvote"
    put "dislike", to: "lectures#downvote"
    put :add_to_fav
    delete :delete_from_fav
  end
  end
  resources :courses
  resources :users
  match ':controller(/:action(/:id))',:via=>[:get,:post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

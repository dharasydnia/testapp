Testapp::Application.routes.draw do

  resources :clients

  get "users/show"

#  get "authorizations/new"
  resources :authorizations, :only => :create

#  get "access_tokens/index"

  match "/settings/applications" => "access_tokens#index", :as => :applications
  put "access_tokens/revoke/:id" => "access_tokens#revoke"

  match 'oauth/authorize', :to => 'authorizations#new'
  post 'oauth/token', :to => proc {|env| TokenEndpoint.new.call(env)}

  match "/signout" => "sessions#destroy", :as => :signout
  match "/signin" => "sessions#new", :as => :signin

  match "/adauth" => "sessions#create"
  
#  get "sessions/index"

  resources :sessions

  root :to => "sessions#index"
end

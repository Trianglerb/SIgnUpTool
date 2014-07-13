Rails.application.routes.draw do
  root 'sign_ups#index'
  resource :sign_ups
end

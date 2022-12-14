Rails.application.routes.draw do
  root to: "questions#index"

  resources :questions do
    member do
      patch :hide
      put :hide
    end
  end

  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: %i[index]
  resources :hashtags, param: :text, only: %i[show]
end

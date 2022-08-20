Rails.application.routes.draw do
  root to: "questions#index"

  resources :questions do
    member do
      patch :hide
      put :hide
    end
  end
end

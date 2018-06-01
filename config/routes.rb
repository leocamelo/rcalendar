Rails.application.routes.draw do
  root 'examples#index'

  namespace :v1, defaults: { format: :json } do
    resources :events, only: %i[index create update]
  end
end

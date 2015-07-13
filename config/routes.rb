Rails.application.routes.draw do

  root 'examples#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:index, :create, :update]
    end
  end

end

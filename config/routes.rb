Rails.application.routes.draw do

  root 'docs#welcome'

  get 'docs' => 'docs#index', as: :docs
  get 'health_check' => 'docs#health_check', as: :health_check

  namespace :api do
    namespace :v1 do

      # api/v1/analytics_controller
      resources :analytics, only: [] do
        collection do
          get :example
        end
      end

    end
  end
end

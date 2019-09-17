Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/olympians',      to: 'olympians#index'
      get '/olympian_stats', to: 'olympian_stats#index'

      get '/events',         to: 'events#index'
      namespace :events do
        get '/:id/medalists', to: 'event_medalists#index'
      end
      
    end
  end
end

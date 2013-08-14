Nesty::Application.routes.draw do
  resources :designs, except: [ :new, :edit ], format: { default: :json } do
    resources :periods, except: [ :new, :edit ], format: { default: :json } do
      resources :expectations, except: [ :new, :edit ], format: { default: :json }
    end
  end

  root 'designs#index'
end

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions},
    path_names: { sign_in: :login }
    resource :user, only: [:show, :update]

    resource :shipments, only: [] do 
	  	collection do 
	  		get :search
	  	end
	  end

    resources :bookings, except: [:new, :edit]
  end
end

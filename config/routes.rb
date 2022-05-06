Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :bases
  
  resources :users do
    collection {post :import}
    
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month' 
      get 'basic_info_modification'
      get 'list_of_employees'
      get 'show_confirmation'
      
    end
    resources :attendances do
      get 'sample'
      get 'edit_overwork_reqest'
      get 'sample_edit_overwork_notice'
      get 'edit_overwork_notice'
      patch 'sample_update_overwork_reqest'
      patch 'update_overwork_reqest'
      collection do 
        patch 'sample_edit_overwork_approval'
      end
    end
  end
  
  #ここから
  
  
end
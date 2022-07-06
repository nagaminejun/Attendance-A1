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
      get 'attendances/sample_log'
      get 'attendances/log'
      patch 'attendances/update_one_month' 
      patch 'attendances/edit_monthly_request'
      get 'basic_info_modification'
      get 'list_of_employees'
      get 'show_confirmation'
      
    end
    resources :attendances do
      get 'edit_overwork_reqest'
      get 'edit_overwork_notice'
      get 'edit_day_notice'
      get 'edit_one_month_notice'
      
      get 'sample'
      get 'sample_edit_overwork_notice'
      get 'sample_edit_day_notice'
      get 'sample_edit_one_month_notice'
      patch 'sample_update_overwork_reqest'
      
      patch 'update_overwork_reqest'
      
      collection do 
        patch 'edit_overwork_approval'
        patch 'edit_day_approval'
        patch 'edit_one_month_approval'
        
      end
    end
  end
  
end
Rails.application.routes.draw do
  root 'users#index'
  
  get '/articles', to: redirect('/posts')
  
  resources :users, shallow: true do 
    resources :posts do
      resources :comments
      end
    end
  # namespace :admin do
  #   resources :posts, :comments
  # end
  

  # scope module: 'admin' do
  #   resources :posts, :comments
  # end
  
  # scope shallow_path: "sekret" do
  #   resources :posts do
  #     resources :comments, shallow: true
  #   end
  # end
  
  
  
end

IbrahimTest::Application.routes.draw do
  resources :products, :only => [:create, :edit, :update, :destroy]

  root :to => "products#index"
  match '/show_product/:id', :to => 'products#show_product'
end

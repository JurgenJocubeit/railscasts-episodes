ActionController::Routing::Routes.draw do |map|
  map.revert_version "versions/:id/revert", :controller => :versions, :action => :revert, :method => :post
  map.resources :products
  map.root :controller => "products", :action => "index"
end

# Put your extension routes here.

# map.namespace :admin do |admin|
#   admin.resources :whatever
# end
map.namespace :admin do |admin|
  admin.resources :promotions
  admin.add_product_to_promotion '/promotions/:id/add_product', :controller => 'promotions', :action => 'add_product'
  admin.remove_product_from_promotion '/promotions/:id/remove_product', :controller => 'promotions', :action => 'remove_product'
end

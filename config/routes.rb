Rails.application.routes.draw do
  get '/:tree_id', controller: :dynamic_trees, action: :show
  get '/:tree_id/parent/:id', controller: :dynamic_trees, action: :parent
  get '/:tree_id/child/:id', controller: :dynamic_trees, action: :child
  root 'dynamic_trees#index'
end

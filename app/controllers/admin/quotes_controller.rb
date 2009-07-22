class Admin::QuotesController < Admin::ResourceController
  model_class Quote
  login_required
  only_allow_access_to :index, :show, :new, :create, :edit, :update, :remove, :destroy, 
    :when => [:admin, :developer],
    :denied_url => "/admin/pages",
    :denied_message => 'You must have developer privileges to perform this action.'
end

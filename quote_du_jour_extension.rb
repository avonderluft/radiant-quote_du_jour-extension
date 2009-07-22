# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class QuoteDuJourExtension < Radiant::Extension
  version "1.0"
  description "Enables you to display random quotes on your pages"
  url "http://yourwebsite.com/quote_du_jour"
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get } do |admin|
      admin.resources :quotes
    end
  end
  
  def activate
    Page.send :include, QuoteDuJour::Tags
    admin.tabs.add "Quotes", "/admin/quotes", :after => "Layouts", 
                               :visibility => [:admin, :developer]
  end
  
  def deactivate
    admin.tabs.remove "Quotes"
  end
  
end

class Quote < ActiveRecord::Base
  validates_presence_of :author, :message => 'required'
  validates_presence_of :quote, :message => 'required'
end

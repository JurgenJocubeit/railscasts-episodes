class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_at
  has_paper_trail
  named_scope :released_at_desc, :order => "#{table_name}.released_at DESC"
end

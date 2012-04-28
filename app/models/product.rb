class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price

  validates_presence_of :name, :price, :description
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
end

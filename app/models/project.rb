class Project < ActiveRecord::Base
  attr_accessible :description, :name

  validates_length_of :name, in: 2..42

  has_many :issues
end

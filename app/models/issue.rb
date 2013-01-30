class Issue < ActiveRecord::Base
  attr_accessible :description, :name, :project_id, :closed, :due
end

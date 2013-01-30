class AddDateAndUserToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :due, :date
    add_column :issues, :user_id, :integer
  end
end

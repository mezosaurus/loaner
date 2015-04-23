class AddUserToCategoryAndBorrower < ActiveRecord::Migration
  def change
        add_column :categories, :user_id, :integer
        add_column :borrowers, :user_id, :integer
  end
end

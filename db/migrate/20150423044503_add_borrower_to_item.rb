class AddBorrowerToItem < ActiveRecord::Migration
    def change
        add_column :items, :borrower_id, :integer
  end
end

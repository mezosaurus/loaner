class Item < ActiveRecord::Base
	belongs_to :category
    belongs_to :borrower
    belongs_to :user
end

class Group < ApplicationRecord
  has_many :users, through: :expenses
  has_many :expenses, through: :group_expenses
  has_many :group_expenses
end

class Group < ApplicationRecord
  has_many :users, through: :expenses
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses
  validates :name, presence: true
  validates :icon, presence: true
end

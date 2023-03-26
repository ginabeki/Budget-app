require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Associations test' do
    it { should belong_to(:author) }
    it { should have_many(:group_expenses) }
    it { should have_many(:groups).through(:group_expenses) }
  end

  describe 'Validation test' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end
end

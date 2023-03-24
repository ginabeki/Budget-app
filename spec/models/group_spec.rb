require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Associations test' do
    it { should belong_to(:author) }
    it { should have_many(:group_expenses) }
    it { should have_many(:expenses).through(:group_expenses) }
  end

  describe 'Validation test' do
    it { should validate_presence_of(:name) }
  end
end

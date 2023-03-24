require 'rails_helper'

describe '/group/ new', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
  end

  scenario 'user can create contract' do
    visit new_group_path
    expect(page).to have_text('Categories')
    fill_in 'Name', with: 'Test Group'

    expect(page).to have_text('Categories')

    fill_in 'Name', with: 'Test Contract'

    expect(page).to have_text('CREATE NEW CATEGORY')
  end
end

require 'rails_helper'

describe '/', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'after login user page should be categories, after logout it should be splash' do
    visit root_path

    expect(page).to have_text('Sign up')

    expect(page).to have_text('Log in')
  end
end

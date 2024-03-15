require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User registration', type: :feature do
    it 'user can register' do
        visit '/users/sign_up'
        fill_in 'Email', with: "email@email.email"
        fill_in 'Password', with: "password"
        fill_in 'Password confirmation', with: "password"
        find('#commit').click
        expect(page).to have_content('A message with a confirmation link has been sent to your email address')
    end
end
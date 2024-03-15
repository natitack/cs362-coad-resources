require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
    before do
        # create user
        user = create(:user, email: "name@name.name", password: "password")
    end
    it 'user can log in' do
        visit '/users/sign_in'
        fill_in 'Email', with: "name@name.name"
        fill_in 'Password', with: "password"
        click_on 'Sign in'
        expect(page).to have_content('Signed in successfully.')
    end
end

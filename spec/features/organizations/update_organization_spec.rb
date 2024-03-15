require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
    before do
        # create user
        user = create(:user, :organization_approved)
        # sign in as user
        log_in_as(user)
    end
    it 'organization can be updated' do
        click_on 'Edit Organization'
        fill_in 'Name', with: 'New Name'
        click_on 'Update Resource'
        expect(page).to have_content('New Name')
    end

end

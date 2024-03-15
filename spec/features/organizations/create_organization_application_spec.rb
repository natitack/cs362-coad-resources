require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
    before do
        # create admin
        admin = create(:user, :admin)
        # sign in as admin
        log_in_as(admin)
        # create organization
        organization = create(:organization, :name => "Test Organization")
    end
    # navigate to the organizations page
    it 'organization application can be created' do
        click_on 'Organizations'
        click_on 'Pending'

        # test response
        expect(page).to have_content('Test Organization')
    end


end

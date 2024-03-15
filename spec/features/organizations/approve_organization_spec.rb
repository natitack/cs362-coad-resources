require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
    before do
        # create admin
        admin = create(:user, :admin)
        # sign in as admin
        log_in_as(admin)
        # create organization
        organization = create(:organization)
        
    end
    # navigate to the organizations page
    it 'organization can be approved' do
        click_on 'Organizations'
        click_on 'Pending'
        click_on 'Review'
        click_on "Approve"

        # test response
        expect(page).to have_content('has been approved.')
    end

end

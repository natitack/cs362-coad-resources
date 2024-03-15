require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
    before do

        # create admin
        admin = create(:user, :admin)
        # sign in as admin
        log_in_as(admin)
      end
        # navigate to the regions page
        it 'region can be deleted' do
            click_on 'Regions'
            click_on 'Add Region'
            fill_in 'Name', with: 'Test Bend'
            click_on "Add Region"
            click_on 'Regions'
            click_on 'Test Bend'
            click_on 'Delete'
            # test response
            expect(page).to have_content('Region Test Bend was deleted.')
        end
end

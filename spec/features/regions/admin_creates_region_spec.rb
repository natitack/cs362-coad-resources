require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
  before do
    # create admin
    admin = create(:user, :admin)
    # sign in as admin
    log_in_as(admin)
  end
    # navigate to the regions page
    it 'region can be generated' do
      click_on 'Regions'
      click_on 'Add Region'
      fill_in 'Name', with: 'Test Bend'
      click_on "Add Region"


  # test response
  expect(page.body).to have_text('Test Bend')

end
end

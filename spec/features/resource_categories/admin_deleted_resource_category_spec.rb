require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
    before do
        # create admin
        admin = create(:user, :admin)
        # sign in as admin
        log_in_as(admin)
        # create resource category
        resource_category = create(:resource_category, :name => "Test Resource Category")
    end
    # navigate to the resource categories page
    it 'resource category can be deleted' do
        click_on 'Categories'
        click_on "Test Resource Category"
        click_on 'Delete'
        expect(page).to have_content('was deleted.')
    end

end

require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
    before do
        admin = create(:user, :admin)
        log_in_as(admin)
        ticket = create(:ticket, :name => "Test Ticket")
    end

    it "ticket can be deleted" do
        click_on "Dashboard"
        click_on "Test Ticket"
        click_on "Delete"
        expect(page).to have_content('was deleted.')
    end
end

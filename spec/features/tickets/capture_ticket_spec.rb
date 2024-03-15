require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
    before do
        organization = create(:organization, :name => "Test Organization", :status => "approved")
        ticket = create(:ticket, :name => "Test Ticket", :organization => organization)
        user = create(:user, :organization => organization)
        log_in_as(user)
    end

    it "ticket can be captured" do
        click_on "Dashboard"
        click_on "Tickets"
        click_on "Test Ticket"
        expect(page).to have_content("Test Organization")
    end
end

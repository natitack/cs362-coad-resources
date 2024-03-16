require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
    before do
        organization = create(:organization, :name => "Test Organization", :status => "approved")
        ticket = create(:ticket, :name => "Test Ticket", :organization => organization)
        user = create(:user, :organization => organization)
        log_in_as(user)
    end

    it "ticket can be closed" do
        click_on "Dashboard"
        click_on "Tickets"
        click_on "Test Ticket"
        click_on "Release"
        click_on "Tickets"
        click_on "Test Ticket"
        expect(page).to_not have_content("Closed")
    end
end

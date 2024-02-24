require 'rails_helper'

# test for new
RSpec.describe TicketsController, type: :controller do
    describe "GET #new" do
        context "new creates a new ticket" do
            it "new creates new ticket" do
                get :new
                expect(response).to be_successful
            end
        end
    end
end

#tests for create
require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
    require 'rails_helper'

    describe "POST #create" do
        context "creates a ticket with valid attributes" do
            it "creates a valid ticket " do
                ticket = create(:ticket)
                expect(ticket).to be_valid
            end
        end
        context "saved ticket is redirected to ticket_submitted_path" do
            it "ticket successfully redirected" do
                ticket = create(:ticket)
                expect(ticket.save).to eq(true)
            end
        end
        context "throws an error if ticket is not valid" do
            it "ticket is not valid" do
                ticket = build(:ticket, :name => nil)
                expect(ticket).not_to be_valid
            end
        end
        context "ticket is not saved if it is not valid" do
            it "ticket is not saved" do
                ticket = build(:ticket, :name => nil)
                expect(ticket.save).to eq(false)
            end
        end
    end
end




# tests for close
RSpec.describe TicketsController, type: :controller do
    describe "PATCH #close" do
        context "as a logged out user" do
            it "redirects to dashboard" do
            ticket = create(:ticket)
            patch :close, params: { id: ticket.id }
            expect(response).to redirect_to(dashboard_path)
            end
        end
        context "as a logged in orginization approved user" do
            it "redirects to dashboard #tickets:organization" do
                user = create(:user, :organization_approved)
                sign_in(user)
                ticket = create(:ticket, :organization_id => user.organization.id)
                patch :close, params: { id: ticket.id }
                expect(response).to redirect_to(dashboard_path << '#tickets:organization')
            end
        end
        context "as an admin" do
            it "redirects to dashboard #tickets:open" do
                user = create(:user, :admin)
                sign_in(user)
                ticket = create(:ticket)
                patch :close, params: { id: ticket.id }
                expect(response).to redirect_to(dashboard_path << '#tickets:open')
            end
        end
        context "as a logged in user who is not an admin or organization approved" do
            it "to be successful" do
                user = create(:user, :organization_approved)
                sign_in(user)
                ticket = create(:ticket)
                patch :close, params: { id: ticket.id }
                expect(response).to be_successful
            end
        end

    end

end

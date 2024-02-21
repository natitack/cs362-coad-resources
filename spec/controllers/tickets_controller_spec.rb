require 'rails_helper'

# test for close
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

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
    end

end

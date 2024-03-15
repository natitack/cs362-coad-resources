require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  context "as an admin" do
    let(:user) { instance_double('User', admin?: true)}

      it "gets the admin dashboard" do
        expect(helper.dashboard_for(user)).to eq 'admin_dashboard'
    end
  end

  context "as an organization submitted user" do
    let(:user) { instance_double('User', admin?: false,
      organization: Organization.new(status: :submitted)) }

    it "gets the organization submitted dashboard" do
      expect(helper.dashboard_for(user)).to eq 'organization_submitted_dashboard'
    end
  end  

  context "as an organization approved user" do
    #let(:user) { build(:user, :organization_approved) }
    let(:user) { instance_double('User', admin?: false,
      organization: Organization.new(status: :approved)) }

    describe "gets the organization_approved dashboard" do
      it {
        expect(helper.dashboard_for(user)).to eq 'organization_approved_dashboard'
      }
    end
  end
end
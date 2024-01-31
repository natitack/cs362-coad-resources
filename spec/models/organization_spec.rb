require 'rails_helper'

RSpec.describe Organization, type: :model do
   setup do
     @organization1 = build(:organization)
   end

    it "Organization has email" do
      expect(@organization1).to respond_to(:email)
    end
    it "Organization has name" do
      expect(@organization1).to respond_to(:name)
    end
    it "Organization has phone" do
      expect(@organization1).to respond_to(:phone)
    end
    it "Organization has status" do
      expect(@organization1).to respond_to(:status)
    end
    it "Organization has primary_name" do
        expect(@organization1).to respond_to(:primary_name)
    end
    it "Organization has secondary_name" do
        expect(@organization1).to respond_to(:secondary_name)
    end
    it "Organization has secondary_phone" do
        expect(@organization1).to respond_to(:secondary_phone)
    end
    it "has a string representation that is its name" do
        expect(@organization1.to_s).to eq(@organization1.name)
    end
    it "Organization.approve sets status to approved" do
        @organization1.approve
        expect(@organization1.status).to eq("approved")
    end
    it "Organization.reject sets status to rejected" do
        @organization1.reject
        expect(@organization1.status).to eq("rejected")
    end

end

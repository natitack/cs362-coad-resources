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
    

end

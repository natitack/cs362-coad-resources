require 'rails_helper'

RSpec.describe Organization, type: :model do
   setup do
     @organization1 = build(:organization)
     @organization2 = build(:organization)

   end
  # test presence of attributes (characterization tests)    
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
    # test member functions
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
    it "initialize sets status to submitted" do
        expect(@organization2.status).to eq("submitted")
        puts @organization2.errors.full_messages #command prints output of why a test using organization2 fails 
    end
    # test presence of validations
    it "Organization validates presence of email" do
        expect(@organization1).to validate_presence_of(:email)
    end
    it "Organization validates presence of name" do
        expect(@organization1).to validate_presence_of(:name)
    end
    it "Organization validates presence of phone" do
        expect(@organization1).to validate_presence_of(:phone)
    end
    it "Organization validates presence of status" do
        expect(@organization1).to validate_presence_of(:status)
    end
    it "Organization validates presence of primary_name" do
        expect(@organization1).to validate_presence_of(:primary_name)
    end
    it "Organization validates presence of secondary_name" do
        expect(@organization1).to validate_presence_of(:secondary_name)
    end
    it "Organization validates presence of secondary_phone" do
        expect(@organization1).to validate_presence_of(:secondary_phone)
    end
    it "Organization validates length of email" do
        expect(@organization1).to validate_length_of(:email).is_at_least(1).is_at_most(255)
    end
    it "Organization validates uniqueness of email" do
        expect(@organization1).to validate_uniqueness_of(:email).case_insensitive
    end
    it "Organization validates length of name" do
        expect(@organization1).to validate_length_of(:name).is_at_least(1).is_at_most(255)
    end
    it "Organization validates uniqueness of name" do
        expect(@organization1).to validate_uniqueness_of(:name).case_insensitive
    end
    it "Organization validates length of description" do
        expect(@organization1).to validate_length_of(:description).is_at_most(1020)
    end
    #test presence of associations
    it { should have_many(:users) }
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:resource_categories) }
end

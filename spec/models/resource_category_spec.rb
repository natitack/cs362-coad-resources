require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    setup do
        @resource_category1 = build(:resource_category)
        @resource_category2 = build(:resource_category)
        @resource_category3 = build(:resource_category)
        @resource_category4 = build(:resource_category)
        @resource_category5 = build(:resource_category)
    end

  # Characterization tests
    it "ResourceCategory has a name" do
        expect(@resource_category1).to respond_to(:name)
    end

  # Association tests
    it {should have_many(:tickets)}
    it {should have_and_belong_to_many(:organizations)}
    

  # validation tests
    it "ResourceCategory validates presence of name" do
        expect(@resource_category1).to validate_presence_of(:name)
    end
    it "ResourceCategory validates length of name" do
        expect(@resource_category1).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it "ResourceCategory validates uniqueness of name" do
        expect(@resource_category1).to validate_uniqueness_of(:name).case_insensitive
    end
    
  # Test Member Functions
    it "ResourceCategory has a string representation that is its name" do
        expect(@resource_category1.to_s).to eq(@resource_category1.name)
    end
    it "ResourceCategory.activate sets active to true" do
        @resource_category1.activate
        expect(@resource_category1.active).to eq(true)
    end
    it "ResourceCategory.deactivate sets active to false" do
        @resource_category1.deactivate
        expect(@resource_category1.active).to eq(false)
    end
    it "ResourceCategory.inactive? returns true if active is false" do
        @resource_category1.deactivate
        expect(@resource_category1.inactive?).to eq(true)
    end
    it "ResourceCategory.inactive? returns false if active is true" do
        @resource_category1.activate
        expect(@resource_category1.inactive?).to eq(false)
    end

  # Test Static (Class) Functions
    it "ResourceCategory.unspecified returns a ResourceCategory with name 'Unspecified'" do
        r = ResourceCategory.unspecified
        expect(r.name).to eq("Unspecified")
        puts r.errors.full_messages #command prints output of why a test using r fails
    end
  # Test Scope Methods
    it "ResourceCategory.active returns all active ResourceCategories" do
        @resource_category2.activate
        @resource_category3.activate
        @resource_category4.deactivate
        @resource_category5.deactivate
        expect(ResourceCategory.active).to eq([@resource_category2, @resource_category3])
    end

    it "ResourceCategory.inactive returns all inactive ResourceCategories" do
        @resource_category2.activate
        @resource_category3.activate
        @resource_category4.deactivate
        @resource_category5.deactivate
        expect(ResourceCategory.inactive).to eq([@resource_category4, @resource_category5])
    end


end


# Characterization tests
# Association tests
# validation tests
# Test Member Functions
# Test Static (Class) Functions
# Test Scope Methods
require 'rails_helper'

RSpec.describe Ticket, type: :model do
    setup do
        @ticket1 = build(:ticket)
        @ticket2 = build(:ticket)
        @ticket3 = build(:ticket)
        @ticket4 = build(:ticket)
        @ticket5 = build(:ticket)
    end
# Characterization tests
    it "Ticket has name" do
        expect(@ticket1).to respond_to(:name)
    end
    it "Ticket has phone" do
        expect(@ticket1).to respond_to(:phone)
    end
    it "Ticket has region_id" do
        expect(@ticket1).to respond_to(:region_id)
    end
    it "Ticket has resource_category_id" do
        expect(@ticket1).to respond_to(:resource_category_id)
    end
    it "Ticket can have description" do
        expect(@ticket1).to respond_to(:description)
    end

# Association tests
    it {should belong_to(:region)}
    it {should belong_to(:resource_category)}
    it {should belong_to(:organization)}

# validation tests
    it "Ticket validates presence of name" do
        expect(@ticket1).to validate_presence_of(:name)
    end
    it "Ticket validates presence of phone" do
        expect(@ticket1).to validate_presence_of(:phone)
    end
    it "Ticket validates presence of region_id" do
        expect(@ticket1).to validate_presence_of(:region_id)
    end
    it "Ticket validates presence of resource_category_id" do
        expect(@ticket1).to validate_presence_of(:resource_category_id)
    end
    it "Ticket validates length of name" do
        expect(@ticket1).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it "Ticket validates length of description" do
        expect(@ticket1).to validate_length_of(:description).is_at_most(1020).on(:create)
    end
    it "Ticket validates phone number" do
        expect(@ticket1).to allow_value("+1-503-555-1212").for(:phone) #valid phone number must be in international format
        puts @ticket1.errors.full_messages #command prints output of why a test using ticket1 fails
    end
# Test Member Functions
    it "Ticket to_s returns a string containing it's id" do # TODO: id presence is not validated in ticket.rb, if it is mandatory, this may be a bug
        expect(@ticket1.to_s).to eq("Ticket #{@ticket1.id}")
    end
    it "Ticket.open? returns true if closed is false" do
        @ticket1.closed = false
        expect(@ticket1.open?).to eq(true)
    end
    it "Ticket.open? returns false if closed is true" do
        @ticket1.closed = true
        expect(@ticket1.open?).to eq(false)
    end
    it "Ticket.captured? returns true if organization is present" do
        @ticket1.organization = build(:organization)
        expect(@ticket1.captured?).to eq(true)
    end
    it "Ticket.captured? returns false if organization is not present" do
        @ticket1.organization = nil
        expect(@ticket1.captured?).to eq(false)
    end

# Test Static (Class) Functions
    # N/A
# Test Scope Methods
    it "Ticket.open returns all open tickets not assigned to an organization" do
        @ticket1.closed = true
        @ticket2.closed = true
        @ticket3.closed = true
        @ticket4.closed = false
        @ticket5.closed = false
        @ticket4.organization_id = nil
        @ticket5.organization_id = nil
        @ticket1.save! #tickets need to be saved to update the database
        @ticket2.save!
        @ticket3.save!
        @ticket4.save!
        @ticket5.save!
        expect(Ticket.open).to eq([@ticket4, @ticket5])
    end
    it "Ticket.closed returns all closed tickets" do
        @ticket1.closed = true
        @ticket2.closed = true
        @ticket3.closed = true
        @ticket4.closed = false
        @ticket5.closed = false
        @ticket4.organization_id = nil
        @ticket5.organization_id = nil
        @ticket1.save! #tickets need to be saved to update the database
        @ticket2.save!
        @ticket3.save!
        @ticket4.save!
        @ticket5.save!
        expect(Ticket.closed).to eq([@ticket1, @ticket2, @ticket3])
    end

    it "Ticket.all_organization returns all open tickets assigned to an organization" do
        @ticket1.closed = false
        @ticket2.closed = false
        @ticket3.closed = false
        @ticket4.closed = true
        @ticket5.closed = true
        @ticket4.organization_id = nil
        @ticket5.organization_id = nil
        @ticket1.save! #tickets need to be saved to update the database
        @ticket2.save!
        @ticket3.save!
        @ticket4.save!
        @ticket5.save!
        expect(Ticket.all_organization).to eq([@ticket1, @ticket2, @ticket3])
    end
    it "Ticket.organization returns all open tickets assigned to a specific organization" do
        @ticket1.closed = false
        @ticket2.closed = false
        @ticket3.closed = false
        @ticket4.closed = true
        @ticket5.closed = true
        @ticket2.organization_id = @ticket1.organization_id
        @ticket4.organization_id = nil
        @ticket5.organization_id = nil
        @ticket1.save! #tickets need to be saved to update the database
        @ticket2.save!
        @ticket3.save!
        @ticket4.save!
        @ticket5.save!
        expect(Ticket.organization(@ticket1.organization_id)).to eq([@ticket1, @ticket2])
    end
    it "Ticket.closed_organization returns all closed tickets assigned to a specific organization" do
        @ticket1.closed = false
        @ticket2.closed = true
        @ticket3.closed = true
        @ticket4.closed = true
        @ticket5.closed = true
        @ticket2.organization_id = @ticket1.organization_id
        @ticket4.organization_id = nil
        @ticket5.organization_id = nil
        @ticket1.save! #tickets need to be saved to update the database
        @ticket2.save!
        @ticket3.save!
        @ticket4.save!
        @ticket5.save!
        expect(Ticket.closed_organization(@ticket1.organization_id)).to eq([@ticket2])
    end
    it "Ticket.region returns all tickets in a specific region" do
        @ticket1.region_id = 2
        @ticket2.region_id = 1
        @ticket3.region_id = 2
        @ticket4.region_id = 2
        @ticket5.region_id = 3
        @ticket1.save! #tickets need to be saved to update the database
        @ticket2.save!
        @ticket3.save!
        @ticket4.save!
        @ticket5.save!
        expect(Ticket.region(2)).to eq([@ticket1, @ticket3, @ticket4])
    end
    it "Ticket.resource_category returns all tickets in a specific resource category" do
        @ticket1.resource_category_id = 2
        @ticket2.resource_category_id = 1
        @ticket3.resource_category_id = 2
        @ticket4.resource_category_id = 2
        @ticket5.resource_category_id = 3
        @ticket1.save! #tickets need to be saved to update the database
        @ticket2.save!
        @ticket3.save!
        @ticket4.save!
        @ticket5.save!
        expect(Ticket.resource_category(2)).to eq([@ticket1, @ticket3, @ticket4])
    end

end

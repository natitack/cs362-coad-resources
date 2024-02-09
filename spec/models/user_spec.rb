require 'rails_helper'

RSpec.describe User, type: :model do
  setup do
    @user1 = User.new
  end

  # instantiation tests
  it "exists" do
    User.new
  end

  # Characterization tests
  it "User has Name" do
    expect(@user1).to respond_to(:email)
  end

  it "User has Role" do
    expect(@user1).to respond_to(:role)
  end

  # Association tests
  it {should belong_to(:organization)}

  # Validation tests
  it "User validates presence of email" do
    expect(@user1).to validate_presence_of(:email)
  end

  it "User validates length of email" do
    expect(@user1).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
  end

end

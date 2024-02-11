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
  it "User validates email format" do
    expect(@user1).to validate_uniqueness_of(:email).case_insensitive
  end
  it "User validates presence of password" do
    expect(@user1).to validate_presence_of(:password)
  end
  it "User validates length of password" do
    expect(@user1).to validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)
  end

  # Member Functions tests
  it "User has a string representing its email" do
    email = 'test@test.test'
    user = User.new(email: email)
    result = user.to_s
    expect(result).to eq(email)
  end
  it "User can set role to organization" do
    expect(@user1.role).to eq("organization")
  end

end

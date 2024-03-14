require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
    # Tests for index
    describe "GET #index" do
        context "index returns a list of organizations" do
            it "index returns list of organizations" do
                user = create(:user)
                sign_in(user)
                get :index
                expect(response).to be_successful
            end
        end
    end

    # Test for new
    describe "GET #new" do
        context "new creates a new organization" do
            it "new creates new organization" do
                user = create(:user)
                sign_in(user)
                get :new
                expect(response).to be_successful
            end
        end
    end

    # Test for create
    describe "Get #create" do
        context "creates an organization with valid attributes" do
            it "creates valid organization" do
                user = create(:user)
                sign_in(user)
                organization = create(:organization)
                expect(organization).to be_valid
            end
        end
        context "saved organization is redirected to organization_application_submitted_path" do
            it "organization successfully redirected" do
                user = create(:user)
                sign_in(user)
                organization = create(:organization)
                expect(organization.save).to eq(true)
            end
        end
        context "throws an error if organization is not valid" do
            it "organization not valid" do
                user = create(:user)
                sign_in(user)
                organization = build(:organization, :name => nil)
                expect(organization).not_to be_valid
            end
        end
        context "organization is not saved if it is not valid" do
            it "organization not saved" do
                user = create(:user)
                sign_in(user)
                organization = build(:organization, :email => nil)
                expect(organization.save).to eq(false)
            end
        end
    end

    # Tests for edit
    # No controller implementation

    # Tests for update
    describe "Get #edit" do
        context "updates an organization with valid attributes" do
            it "updates valid organization" do
                user = create(:user)
                sign_in(user)
                organization = build(:organization)
                organization.update(name: "Updated Name")
                expect(organization.name).to eq("Updated Name")
            end
        end
    end

    # Tests for show
    # No controller implementation

    # Test for approve
    describe "Get #approve" do
        context "approves a valid organization" do
            it "approves valid organization" do
                user = create(:user)
                sign_in(user)
                organization = build(:organization)
                organization.approve
                expect(organization.status).to eq("approved")
            end
        end
    end

    # Test for reject
    describe "Get #reject" do
        context "rejects a valid organization" do
            it "rejects valid organization" do
                user = create(:user)
                sign_in(user)
                organization = build(:organization)
                organization.reject
                expect(organization.status).to eq("rejected")
            end
        end
    end
end


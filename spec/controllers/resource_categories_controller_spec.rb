require 'rails_helper'
# double / mock test 
RSpec.describe ResourceCategoriesController, type: :controller do
  
    describe '#activate' do
      it 'redirects to resource_category with an alert' do
        user = create(:user, :admin)
        sign_in(user)
        resource_category = create(:resource_category)
        allow_any_instance_of(ResourceCategory).to receive(:activate).and_return(false)

        patch :activate, params: { id: resource_category.id }
        expect(response).to redirect_to(resource_category)
        expect(flash[:alert]).to eq('There was a problem activating the category.')
      end
    end
  end

RSpec.describe ResourceCategoriesController, type: :controller do
    #test for new
    describe "GET #new" do
        context "new creates a new resource category" do
            it "new creates new resource category" do
                user = create(:user, :admin)
                sign_in(user)
                get :new
                expect(response).to be_successful
            end
        end
    end
    # test for create
    describe "POST #create" do
        context "creates a resource category with valid attributes" do
            it "creates a valid resource category" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = create(:resource_category)
                expect(resource_category).to be_valid
            end
        end
        context "saved resource category is redirected to resource_categories_path" do
            it "resource category successfully redirected" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = create(:resource_category)
                expect(resource_category.save).to eq(true)
            end
        end
        context "throws an error if resource category is not valid" do
            it "resource category is not valid" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = build(:resource_category, :name => nil)
                expect(resource_category).not_to be_valid
            end
        end
        context "resource category is not saved if it is not valid" do
            it "resource category is not saved" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = build(:resource_category, :name => nil)
                expect(resource_category.save).to eq(false)
            end
        end
    end
        # Test for update
    describe "PATCH #update" do
        context "updates a resource category with valid attributes" do
            it "updates a valid resource category" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = create(:resource_category)
                resource_category.update(name: "New Name")
                expect(resource_category.name).to eq("New Name")
            end
        end
    end
    # test for activate
    describe "PATCH #activate" do
        context "activates a resource category" do
            it "activates a resource category" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = create(:resource_category)
                resource_category.activate
                expect(resource_category.active).to eq(true)
            end
        end
        context "redirects to resource category" do
            it "resource category successfully redirected" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = create(:resource_category)
                patch :activate, params: { id: resource_category.id }
                expect(response).to redirect_to(resource_category)
            end
        end

    end
        # tests for deactivate
    describe "PATCH #deactivate" do
        context "deactivates a resource category" do
            it "deactivates a resource category" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = create(:resource_category)
                resource_category.deactivate
                expect(resource_category.active).to eq(false)
            end
        end
        context "redirects to resource category" do
            it "resource category successfully redirected" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = create(:resource_category)
                patch :deactivate, params: { id: resource_category.id }
                expect(response).to redirect_to(resource_category)
            end
        end
    end
    # tests for destroy
    describe "DELETE #destroy" do
        context "deletes a resource category" do
            it "deletes a resource category" do
                user = create(:user, :admin)
                sign_in(user)
                resource_category = create(:resource_category)
                delete :destroy, params: { id: resource_category.id }
                expect(response).to redirect_to(resource_categories_path)
            end
        end
    end
end
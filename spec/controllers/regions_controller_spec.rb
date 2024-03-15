require 'rails_helper'

# Tests for index
RSpec.describe RegionsController, type: :controller do
  describe "GET #index" do
    it "index successfuly returns list of regions" do
      user = create(:user, :admin)
      sign_in(user)
      get :index
      expect(response).to be_successful
    end
  end
end

# Tests for show
RSpec.describe RegionsController, type: :controller do
  describe "GET #show" do
    context "as an admin" do
      let(:user) { create(:user, :admin) }
      before(:each) { sign_in(user) }
      let(:region) { create(:region) }
      it "returns a region" do
        get :show, params: { id: region.id }
        expect(response).to be_successful
      end
    end

    context "as a non-admin user" do
      let(:user) { create(:user) }
      before(:each) { sign_in(user) }
      let(:region) { create(:region) }
      it "returns a region" do
        get :show, params: { id: region.id }
        expect(response).to_not be_successful
      end
    end
  end
end

# Tests for new
RSpec.describe RegionsController, type: :controller do
  describe "GET #new" do
    context 'as an admin' do
      let(:user) { create(:user, :admin) }
      before(:each) { sign_in(user) }
      let(:region) { create(:region) }

      it "new creates new region" do
        get :new
        expect(response).to be_successful
      end
    end
  end
end

# Tests for create
RSpec.describe RegionsController, type: :controller do
  context 'as an admin' do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }
    let(:region) { create(:region) }

    describe "POST #create" do
      it "creates valid region" do
        post(:create, params: { region: attributes_for(:region) })
        expect(response).to redirect_to(regions_path)
      end

      it "saves valid region" do
        expect_any_instance_of(Region).to receive(:save).and_return(false)
        post(:create, params: { region: attributes_for(:region) })
        expect(response).to be_successful
      end
      
      it "fails to create invalid region" do
        region = build(:region, :name => nil)
        expect(region).not_to be_valid
      end
    end
  end
end

# Tests for edit
RSpec.describe RegionsController, type: :controller do
  context "as an admin" do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }
    let(:region) { create(:region) }
    
    describe "Get #edit" do
      it "returns a region" do
        get :edit, params: { id: region.id }
        expect(response).to be_successful
      end
    end
  end
end

# Tests for update
RSpec.describe RegionsController, type: :controller do
  context "as an admin" do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }
    let(:region) { create(:region) }

    describe "Patch #update" do
      it "updates a valid region" do
        region.update(name: "Updated Name")
        expect(region.name).to eq("Updated Name")
      end
    end
  end
end

# Tests for destroy
RSpec.describe RegionsController, type: :controller do
  context "as an admin" do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }
    let(:region) { create(:region) }

    describe "Delete #destroy" do
      it "deletes a region" do
        delete :destroy, params: { id: region.id }
        expect(response).to redirect_to(regions_path)
      end
    end
  end
end
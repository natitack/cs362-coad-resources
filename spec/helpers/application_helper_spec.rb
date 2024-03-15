require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
    # Tests for full_title
    describe "#full_title" do
        it "returns default title" do
            expect(helper.full_title).to eq("Disaster Resource Network")
        end

        it "returns modified param title" do
            expect(helper.full_title("Test Title")).to eq("Test Title | Disaster Resource Network")
        end
    end

end

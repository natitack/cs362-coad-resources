require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper do
  describe '#format_phone_number' do
    it 'formats a phone number' do
      expect(helper.format_phone_number('333')).to eq('+1333')
    end
  end

end

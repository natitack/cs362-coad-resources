require 'rails_helper'

RSpec.describe Region, type: :model do
  # beej demo
  let(:region){ build(:region, name => 'Mt. Hood')}

  setup do
    @region2 = build(:region)
    @region3 = build(:region)
    #show the names are added using a sequence
    #pp @region2.to_s
    #pp @region3.to_s
  end

  it "exists" do
    Region
    @region2
    @region3
  end

  it "exists" do
    Region.new
  end

  it "has a name" do
    region = Region.new
    expect(region).to respond_to(:name)
  end

  it "has a string representation that is its name" do
    name = 'Mt. Hood'
    region = Region.new(name: name)
    result = region.to_s
    expect(result).to eq(name)
  end

  # beej demo
  it "has a name2" do
    region = build(:region, name: "other_fake_region_name")
    expect(region).to respond_to(:name)
  end

  it "has a region.unspecified method" do
    r= Region.unspecified
    expect(r.name).to eq('Unspecified')
  end

end

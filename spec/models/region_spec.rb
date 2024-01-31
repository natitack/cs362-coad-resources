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
# instantiation tests
  it "exists" do
    Region
    @region2
    @region3
  end

  it "exists" do
    Region.new
  end

  # Characterization tests
  it "has a name" do
    region = Region.new
    expect(region).to respond_to(:name)
  end

  it "has a name2" do # beej demo
    region = build(:region, name: "other_fake_region_name")
    expect(region).to respond_to(:name)
  end

  # association tests
  it {should have_many(:tickets)}

  # validation tests
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)}
  it {should validate_uniqueness_of(:name).case_insensitive}
  
  # Test Member Functions
  it "has a string representation that is its name" do
    name = 'Mt. Hood'
    region = Region.new(name: name)
    result = region.to_s
    expect(result).to eq(name)
  end

  # Test Static (Class) Functions
  it "has a region.unspecified method" do
    r= Region.unspecified
    expect(r.name).to eq('Unspecified')
  end

end

FactoryBot.define do
    factory :ticket do
        name 
        phone
        region_id { "fake_name_1"}
        resource_category_id { "fake_name_1"}
        description
        region { FactoryBot.create(:region) } # tickets belong to regions and resource_categories, so tickets cant be created without this association
        resource_category { FactoryBot.create(:resource_category) }
        id
        organization_id {FactoryBot.create(:organization).id}


    end
end
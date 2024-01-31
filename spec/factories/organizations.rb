FactoryBot.define do
    factory :organization do
        name 
        email
        phone
        status { :submitted  }
        primary_name
        secondary_name
        secondary_phone
    end
end
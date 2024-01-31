# beej demo
# this sequence is used in spec/factories/regions.rb
FactoryBot.define do
    sequence :name do |n|
        "fake_name_#{n}"
    end
    sequence :email do |n|
            "fake_email_#{n}@fake.com"
    end
    sequence :phone do |n|
        "000-000-000{n}"
    end
    sequence :primary_name do |n|
        "fake_primary_name_#{n}"
    end
    sequence :secondary_name do |n| 
        "fake_secondary_name_#{n}"
    end
    sequence :secondary_phone do |n|
        "000-000-000{n}"
    end



end
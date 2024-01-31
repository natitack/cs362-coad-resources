# beej demo
# sequences.rb is used in all other factories.rb
FactoryBot.define do
    sequence :name do |n|
        "fake_name_#{n}"
    end
    sequence :email do |n|
            "fake_email_#{n}@fake.com"
    end
    sequence :phone do |n|
        "+1-503-555-121#{n[1]}"
    end
    sequence :primary_name do |n|
        "fake_primary_name_#{n}"
    end
    sequence :secondary_name do |n| 
        "fake_secondary_name_#{n}"
    end
    sequence :secondary_phone do |n|
        "+1-503-555-121#{n[1]}"
    end
    sequence :description do |n|
        "fake_description_#{n}"
    end
    sequence :id do |n|
        "#{n}"
    end



end
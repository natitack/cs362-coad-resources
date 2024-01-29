# beej demo
# this sequence is used in spec/factories/regions.rb
FactoryBot.define do
    sequence :name do |n|
        "fake_name_#{n}"
    end
    sequence :email do |n|
            "fake_email_#{n}@fake.com"
    end

end
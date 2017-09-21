FactoryGirl.define do
  factory :passenger do
    name { Faker::Name.name }
  end
end

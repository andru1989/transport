FactoryGirl.define do
  factory :travel do
    origin { Faker::Address.city  }
    destination { Faker::Address.city  }
    association :vehicle
    association :passenger
  end
end

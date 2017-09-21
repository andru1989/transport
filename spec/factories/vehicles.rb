FactoryGirl.define do
  factory :vehicle do
    color { Faker::Color.color_name }
    model { Faker::Date.between(5.years.ago, Date.today).year }
    licence_plate "ABC#{Faker::Number.number(3)}"
    category :first_category
  end
end

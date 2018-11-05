FactoryGirl.define do
  factory :city do
    name "Lagos"
    state

    trait :second do
      name "Abuja"
    end
  end
end

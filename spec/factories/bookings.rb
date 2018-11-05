FactoryGirl.define do
  factory :booking do
    flight
    user
    code "1QWE323ER"
    passengers_attributes do
      [
        name: "Femi Senjobi",
        email: "femi@gmail.com",
        phone: "08987654346",
        address: "Yaba, Lagos"
      ]
    end
  end

  trait :invalid do
    flight_id nil
  end
end

FactoryGirl.define do
  factory :flight do
    from { create(:airport, :second).id }
    to { create(:airport, :third).id }
    departure Time.zone.tomorrow
    arrival Time.zone.tomorrow
    price 50_000
    plane

    trait :invalid do
      from nil
      to nil
    end

    trait :second do
      to { create(:airport, :second).id }
      from { create(:airport).id }
    end

    trait :departed do
      departure Time.zone.yesterday
    end
  end
end

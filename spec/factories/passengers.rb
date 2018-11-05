FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@baluu.com"
  end

  factory :passenger do
    name "Femi Senjobi"
    email
    phone "08987654346"
    address "Yaba, Lagos"
  end
end

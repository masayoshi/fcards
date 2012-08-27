FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :deck do
    title "Test deck"
    description "Test deck description"
    user
  end

  factory :card do
    front "Test front"
    back "Test back"
    next_study_datetime Time.now
    deck
  end
end

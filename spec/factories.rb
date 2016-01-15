FactoryGirl.define do
  factory :event do
    title "Sofia's birthday"
    started_at { DateTime.now }
  end
end

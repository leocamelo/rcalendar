FactoryGirl.define do

  factory :event do
    title "Sofia's birthday"
    start_date { Date.today.to_s }
    end_date { Date.tomorrow.to_s }
  end
  
end

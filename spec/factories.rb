FactoryGirl.define do

  factory :event do
    title "Sofia's birthday"
    start_date { Date.today }
    end_date { Date.tomorrow }
  end

end

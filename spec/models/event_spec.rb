require 'rails_helper'

RSpec.describe Event, type: :model do

  context 'validations' do
    before { build :event }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
  end

  context 'before save' do

    it '#remove_time_if_all_day' do
      event = create(:event, start_time: Time.now, all_day: true)
      expect(event.start_time).to be_nil
    end

  end

end

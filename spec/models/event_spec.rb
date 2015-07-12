require 'rails_helper'

RSpec.describe Event, type: :model do

  context 'validations' do
    before { build :event }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:started_at) }
  end

  context 'before save' do

    it '#default_ended_at' do
      event = create(:event)
      expect(event.ended_at).to eq(event.started_at + 1.hour)
    end

  end

end

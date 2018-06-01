require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'before save' do
    it '#set_default_ended_at' do
      event = create(:event)
      expect(event.ended_at).to eq(event.started_at + 1.hour)
    end
  end
end

require 'rails_helper'

RSpec.describe Event, type: :model do

  context 'validations' do
    before { build :event }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
  end

end

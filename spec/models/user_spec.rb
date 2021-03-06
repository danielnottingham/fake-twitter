require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:tweets) }
  end

  context 'presence' do
    it { is_expected.to validate_presence_of(:username) }
  end
end

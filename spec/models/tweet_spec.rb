require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'presence' do
    it { is_expected.to validate_presence_of(:comment) }
  end

  context 'relationships' do
    it { is_expected.to belong_to(:user) }
  end
end

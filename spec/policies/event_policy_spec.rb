require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user) }

  context 'when owner' do
    subject { described_class.new(user, event) }

    it { is_expected.to permit_actions(%i[edit update destroy]) }
    it { is_expected.to forbid_actions(%i[index new show create]) }
  end

  context 'when not owner' do
    subject { described_class.new(user2, event) }

    let(:user2) { FactoryBot.create(:user) }

    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end

  context 'when not authentificated' do
    subject { described_class.new(nil, event) }

    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end
end
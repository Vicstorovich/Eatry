require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:user) { create(:user) }
  subject(:profile) { Profile.new(address: 'Dashboard', user_id: user) }

  it { should belong_to(:user) }

  it { should validate_presence_of(:address)}
  it { should validate_uniqueness_of(:user)}
end

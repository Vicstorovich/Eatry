require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user, password: '1234567' }

  it { should have_one(:profile).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email)}

  describe "install_the_first_user_as_an_administrator" do
    let!(:user_1) { create(:user) }
    let!(:user_2) { create(:user) }

    it "user is the admin the application" do
      expect(user_1.admin).to eq true
    end

    it "user is not the admin the application" do
      expect(user_2.admin).to_not eq true
    end
  end
end

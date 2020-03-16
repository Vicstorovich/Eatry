require 'rails_helper'

RSpec.describe App, type: :model do
  subject { build :app, password: "8364848" }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email)}
end

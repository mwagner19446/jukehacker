require 'spec_helper'

describe Host do
  subject {FactoryGirl.create(:host)}
  it { should belong_to(:user) }
  it { should have_many(:parties)}
  it { should validate_uniqueness_of(:user_id) }
  it { should validate_uniqueness_of(:email) }
end

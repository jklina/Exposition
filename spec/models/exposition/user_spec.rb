require 'rails_helper'

RSpec.describe Exposition::User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_length_of(:email).is_at_most(244) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('a@a.com', '12@12.c').for(:email) }
  it { should_not allow_value('a@a', '1', 'a.a').for(:email) }
  it { should have_db_index(:email).unique(true) }
  it { should have_secure_password }
end

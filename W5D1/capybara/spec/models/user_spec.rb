require 'rails_helper'

describe User do
  subject(:user) do
    FactoryBot.build(:user, email: "abc@gmail.com", password: "password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("password")).to be true
    end

    it "verifies a password is incorrect" do
      expect(user.is_password?("notpassword")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user with correct credentials" do
      expect(User.find_by_credentials("abc@gmail.com", "password")).to eq(user)
    end

    it "returns nil given incorrect credentials" do
      expect(User.find_by_credentials("abc1@gmail.com", "notpassword")).to eq(nil)
    end
  end
end

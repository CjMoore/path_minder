require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is not valid without a username" do
        user = User.new(password: "password", email: "cj@cj.com")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(username: "CJ", email: "cj@cj.com")
        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(username: "CJ", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid if there is already a user with that username" do
        User.create(username: "CJ", email: "cj@cj.com", password: "password")
        user = User.new(username: "CJ", email: "different_email@email.com", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid if there is alrady a user with that email" do
        User.create(username: "CJ", email: "cj@cj.com", password: "password")
        user = User.new(username: "other", email: "cj@cj.com", password: "password")
        expect(user).to be_invalid
      end
    end

    context "with valid attributes" do
      it "it is valid" do
        user = User.new(username: "other", email: "cj@cj.com", password: "password")
        expect(user).to be_valid
      end
    end
  end

end

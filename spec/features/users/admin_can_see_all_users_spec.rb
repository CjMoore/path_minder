require 'rails_helper'

describe "when a user visits /admin/users" do
  describe "as an admin" do
    it "they can see a list of users" do
      admin = User.create(username: "CJ", password: "password", email: "cj@cj.com", role: 1)

      default = User.create(username: "default", password: "password", email: "default@default.com" )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/admin/users'
      expect(page).to have_content("CJ")
      expect(page).to have_content("default")
    end
  end

  describe "as default user" do
    it "they see a 404 error message" do
      admin = User.create(username: "CJ", password: "password", email: "cj@cj.com", role: 1)

      default = User.create(username: "default", password: "password", email: "default@default.com", role: 0 )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)
      # byebug
      visit '/admin/users'

      expect(page).to_not have_content("CJ")
      expect(page).to_not have_content("default")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end

require "rails_helper" 

RSpec.describe "sessions#destroy" do
  context "user logs out of account" do
    let(:user) { create(:user, :default_user) }
    before {
      visit "/login"
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Login to Account"

      click_on "Logout"
    }

    it "redirects visitor to the home page" do
      expect(current_path).to eq("/")
    end

    it "alerts the visitor that they have been logged out" do
      within("#main-flash") do
        expect(page).to have_content("You have been successfully logged out.")
      end
    end

    xit "removes all items from the cart" do

    end
  end
end
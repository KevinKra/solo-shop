require "rails_helper"

RSpec.describe "navigation menu" do
  let(:user) { create(:user, :default_user) }
  let(:merchant) { create(:user, :merchant_user) }
  let(:admin) { create(:user, :admin_user) }
  before { visit "/" }

  describe "structure" do
    it "has a home link" do
      within("#main-navbar") do
        expect(page).to have_link('Home', href: "/")
      end
    end
    it "has a items link" do
      within("#main-navbar") do
        expect(page).to have_link('All Items', href: "/items")
      end
    end
    it "has a merchants link" do
      within("#main-navbar") do
        expect(page).to have_link('All Merchants', href: "/merchants")
      end
    end
    it "has a cart link" do
      within("#main-navbar") do
        expect(page).to have_link('Cart', href: "/cart")
      end
    end
  end

  describe "login behaviors" do
    context "when a user is not logged in" do

      it "the navbar contains both login and a registration button" do
        within("#main-navbar") do
          expect(page).to have_content("Login")
          expect(page).to have_content("Register")
          expect(page).not_to have_content("Logout")
        end
      end
    end

    context "when a user is logged in" do
      
      xit "as a default user they see a profile link" do

      end

      xit "as a merchant user they see a merchants dashboard link" do

      end

      xit "as an admin user they see an admin dashboard link" do

      end

    end
  end

end
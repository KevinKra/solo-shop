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
      after(:each) do
        within("#main-navbar") do
          expect(page).to have_link('Home', href: "/")
          expect(page).to have_link('All Items', href: "/items")
          expect(page).to have_link('All Merchants', href: "/merchants")
          expect(page).to have_link("Profile", href: "/profile")
        end
      end
      
      it "as a default user they see a profile link" do
        visit "/login"
        fill_in :email, with: user.email
        fill_in :password, with: user.password
        click_on "Login to Account"

        within("#main-navbar") do
          expect(page).to have_link("Cart", href: "/cart")
          expect(page).not_to have_content("All Users")
          expect(page).not_to have_content("Admin Dashboard")
          expect(page).not_to have_content("Merchant Dashboard")
        end
      end

      it "as a merchant user they see a merchant specific content" do
        visit "/login"
        fill_in :email, with: merchant.email
        fill_in :password, with: merchant.password
        click_on "Login to Account"

        within("#main-navbar") do
          expect(page).to have_link("Merchant Dashboard", href: "/merchant")
          expect(page).to have_link("Cart", href: "/cart")
          expect(page).not_to have_content("All Users")
          expect(page).not_to have_content("Admin Dashboard")
        end
      end

      it "as an admin user they see an admin specific content" do
        visit "/login"
        fill_in :email, with: admin.email
        fill_in :password, with: admin.password
        click_on "Login to Account"

        within("#main-navbar") do
          expect(page).to have_link("Admin Dashboard", href: "/admin")
          expect(page).to have_link("See all Users", href: "/admin/users")
          expect(page).not_to have_content("All Users")
          expect(page).not_to have_content("Merchant Dashboard")
          expect(page).not_to have_content("Cart")
        end
      end

    end
  end

end
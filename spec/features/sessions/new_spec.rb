require "rails_helper"

RSpec.describe "sessions#new" do
  let(:user) { create(:user, :default_user) }
  let(:merchant) { create(:user, :merchant_user) }
  let(:admin) { create(:user, :admin_user) }

  before { visit "/login" }

  describe "user logging in" do

    context "valid credentials" do
      before {
        fill_in :email, with: user.email
        fill_in :password, with: user.password
        click_on "Login to Account"
      }

      it "redirects the user to their profile page" do
        expect(current_path).to eq("/profile")
      end

      it "displays a default success flash message" do
        within("#main-flash") do
          expect(page).to have_content("Welcome, #{user.name}. You have been successfully logged in.")
        end
      end

    end

  end

  describe "merchant logging in" do
    before {
      fill_in :email, with: merchant.email
      fill_in :password, with: merchant.password
      click_on "Login to Account"
    }

    context "valid credentials" do
      it "redirects the merchant to their dashboard page" do
        expect(current_path).to eq("/merchants/dashboard")
      end

      it "displays a merchant success flash message" do
        within("#main-flash") do
          expect(page).to have_content("Welcome, #{merchant.name}. You have been successfully logged in as a Merchant.")
          expect(page).not_to have_content(user.name)
          expect(page).not_to have_content(admin.name)
        end
      end
    end

  end

  describe "admin logging in" do
    before {
      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_on "Login to Account"
    }

    context "valid credentials" do
      it "redirects the admin to their dashboard page" do
        expect(current_path).to eq("/admin/dashboard")
      end

      it "displays a admin success flash message" do
        within("#main-flash") do
          expect(page).to have_content("Welcome, #{admin.name}. You have been successfully logged in as an Admin.")
          expect(page).not_to have_content(user.name)
          expect(page).not_to have_content(merchant.name)
        end
      end
    end

  end

  describe "user attempts to login with invalid credentials" do
    before {
      fill_in :email, with: user.email
      fill_in :password, with: "wrong_password"
      click_on "Login to Account"
    }

    it "redirects to the '/login' page" do
      expect(current_path).to eq("/login")
    end

    it "displays an error message" do
      within("#main-flash") do
        expect(page).to have_content("Invalid email or password.")
      end
    end

  end

  describe "user attempts to visit login page while already logged in" do
    after(:each) do
      within("#main-flash") do
        expect(page).to have_content("Whoops, looks like you're already logged in!")
      end
    end

    it "as a default user it should redirect them to the profile page" do
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Login to Account"
      visit "/login"
      expect(current_path).to eq("/profile")
    end

    it "as a merchant user it should redirect them to the merchant dashboard page" do
      fill_in :email, with: merchant.email
      fill_in :password, with: merchant.password
      click_on "Login to Account"
      visit "/login"
      expect(current_path).to eq("/merchants/dashboard")
    end

    it "as an admin user it should redirect them to the admin dashboard page" do
      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_on "Login to Account"
      visit "/login"
      expect(current_path).to eq("/admin/dashboard")
    end

  end
end
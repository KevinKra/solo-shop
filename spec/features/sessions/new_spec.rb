require "rails_helper"

RSpec.describe "sessions#new" do
  let(:user) { create(:user, :default_user) }
  let(:merchant) { create(:user, :merchant_user) }
  let(:admin) { create(:admin, :admin_user) }

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

      it "user is a default user type" do
        expect(user.role).to eq("default")
        expect(user.role).not_to eq("merchant")
        expect(user.role).not_to eq("admin")
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
      it "redirects the user to their profile page" do
        expect(current_path).to eq("/merchants/dashboard")
      end

      it "displays a default success flash message" do
        within("#main-flash") do
          expect(page).to have_content("Welcome, #{user.name}. You have been successfully logged in as a Merchant.")
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
      
    end

  end

  context "user attempts to login with invalid credentials" do
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


end
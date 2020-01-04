require 'rails_helper'

RSpec.describe "page access controls" do
  let(:user) { create(:user, :default_user) }
  let(:merchant) { create(:user, :merchant_user) }
  let(:admin) { create(:user, :admin_user) }

  context "as a visitor" do
    it "return a 404 page when they visit profile, merchant, admin specific pages" do
      visit "/profile"
      expect(page).to have_http_status(404)
      visit "/merchants/dashboard"
      expect(page).to have_http_status(404)
      visit "/admin/dashboard"
      expect(page).to have_http_status(404)
    end
  end

  before { visit "/login" }
  context "as a user" do
    it "return a 404 if they visit the merchant or admin dashboard" do
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Login to Account"

      visit "/profile"
      expect(page).to have_http_status(200)
      visit "/merchants/dashboard"
      expect(page).to have_http_status(404)
      visit "/admin/dashboard"
      expect(page).to have_http_status(404)
    end
  end

  context "as a merchant" do
    it "return a 404 if they visit the admin dashboard" do
      fill_in :email, with: merchant.email
      fill_in :password, with: merchant.password
      click_on "Login to Account"

      visit "/profile"
      expect(page).to have_http_status(200)
      visit "/merchants/dashboard"
      expect(page).to have_http_status(200)
      visit "/admin/dashboard"
      expect(page).to have_http_status(404)
    end
  end

  context "as an admin" do
    xit "return a 404 if they visit the merchants dashboard or cart page" do
      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_on "Login to Account"

      visit "/profile"
      expect(page).to have_http_status(200)
      visit "/merchants/dashboard"
      expect(page).to have_http_status(404)
      visit "/admin/dashboard"
      expect(page).to have_http_status(200)
      visit "/cart"
      expect(page).to have_http_status(404)
    end

  end
end
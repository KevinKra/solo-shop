require "rails_helper"

RSpec.describe "users#new" do
  user = {
    name: "Steve",
    street_address: "233 Woodfin Lake",
    city: "Madison",
    state: "Virginia",
    zip_code: 34001,
    email: "hello@gmail.com",
    password: "password",
    password_confirmation: "password"
  }

  before { visit "/register" }

  it "should direct them to the register page" do
    expect(current_path).to eq("/register")
  end

  context "valid credentials" do
    before {
      fill_in :name, with: user[:name]
      fill_in :street_address, with: user[:street_address]
      fill_in :city, with: user[:city]
      fill_in :state, with: user[:state]
      fill_in :zip_code, with: user[:zip_code]
      fill_in :email, with: user[:email]
      fill_in :password, with: user[:password]
      fill_in :password_confirmation, with: user[:password_confirmation]
      click_on "Register Account"
    }

    it "adds the user to the database" do
      expect(User.count).to eq(1)
    end

    it "redirects the user to '/profile'" do
      expect(current_path).to eq("/profile")
    end

    it "displays a success notification" do
      within("#main-flash") do
        expect(page).to have_content("Successfully registered and logged in")
      end
    end
  end

  context "invalid credentials" do
    before {
      fill_in :name, with: user[:name]
      fill_in :street_address, with: user[:street_address]
      # fill_in :city, with: user[:city]
      # fill_in :state, with: user[:state]
      fill_in :zip_code, with: user[:zip_code]
      fill_in :email, with: user[:email]
      fill_in :password, with: user[:password]
      fill_in :password_confirmation, with: user[:password_confirmation]
      click_on "Register Account"
    }

    it "does not add the user to the database" do
      expect(User.count).to eq(0)
    end

    it "redirects the user to '/register'" do
      expect(current_path).to eq("/register")
    end

    it "displays a failure message" do
      within("#error_explanation") do
        expect(page).to have_content("City can't be blank")
        expect(page).to have_content("State can't be blank")
      end
    end
  end

  context "email already in use" do
    before {
      User.create!(
        name: "user1", 
        street_address: "311 Westlake Drive",
        city: "Madison",
        state: "Iowa",
        zip_code: 55155,
        email: "user@aol.com",
        password: "password",
        password_confirmation: "password"
      )

      fill_in :name, with: user[:name]
      fill_in :street_address, with: user[:street_address]
      fill_in :city, with: user[:city]
      fill_in :state, with: user[:state]
      fill_in :zip_code, with: user[:zip_code]
      fill_in :email, with: "user@aol.com"
      fill_in :password, with: user[:password]
      fill_in :password_confirmation, with: user[:password_confirmation]
      click_on "Register Account"
    }

    it "does not add the user to the database" do
      expect(User.count).to eq(1)
    end

    it "redirects the user to '/register'" do
      expect(current_path).to eq("/register")
    end

    it "displays a email already taken failure message" do
      within("#error_explanation") do
        expect(page).to have_content("Email has already been taken")
      end
    end
  end

end
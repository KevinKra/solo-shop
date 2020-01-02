require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
  end

  describe "uniqueness" do
    it { should validate_uniqueness_of(:email)}
  end

  describe "roles" do
    it "user can be created as a default user" do
      user = User.create!(
        name: "user",
        street_address: "305 Westin Road",
        city: "Detroit",
        state: "Michigan",
        zip_code: 47308,
        email: "user@gmail.com",
        password: "password",
        password_confirmation: "password",
        role: 0
      )

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it "user can be created as a merchant user" do
      user = User.create!(
        name: "user",
        street_address: "305 Westin Road",
        city: "Detroit",
        state: "Michigan",
        zip_code: 47308,
        email: "user@gmail.com",
        password: "password",
        password_confirmation: "password",
        role: 1
      )

      expect(user.role).to eq("merchant")
      expect(user.merchant?).to be_truthy
    end

    it "user can be created as an admin user" do
      user = User.create!(
        name: "user",
        street_address: "305 Westin Road",
        city: "Detroit",
        state: "Michigan",
        zip_code: 47308,
        email: "user@gmail.com",
        password: "password",
        password_confirmation: "password",
        role: 2
      )

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end
  end
end
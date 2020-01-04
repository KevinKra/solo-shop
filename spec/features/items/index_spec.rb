require "rails_helper"

RSpec.describe "Items#index" do
  context "as any kind of user" do
    before { visit "/items" }

    it "they can visit the items page" do
      expect(current_path).to eq("/items")
    end

    it "they can see all the items, except disabled items" do

    end

    it "clicking an image redirects to that item's show page" do

    end

    it "they can see the 5 most popular items by inventory and total bought" do

    end

    it "they can see the 5 least popular items and their quantity bought" do

    end
  end
end
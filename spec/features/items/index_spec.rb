require "rails_helper"

RSpec.describe "Items#index" do
  let!(:item) { create_list(:item, 3) }

  context "as any kind of user" do
    before { 
      @item_1, @item_2 = create_list(:item, 2)
      @item_3 = Item.create!(
          name: "Wellington Shirt",
          description: "Look Sharp.",
          price: 5550,
          image: "https://www.rlmedia.io/is/image/PoloGSI/s7-1352117_lifestyle?$rl_506_630$",
          active: false,
          inventory: 122,
          gender: 2
      )

      visit "/items" 
    }

    it "they can visit the items page" do
      expect(current_path).to eq("/items")
    end

    it "they can see all the items, except disabled items" do
      expect(page).to have_content(@item_1.name, @item_2.name)
      expect(page).not_to have_content(@item_3.name)
    end

    it "clicking an image redirects to that item's show page" do
      within("#item-#{@item_1.id}") do
        click_link @item_1.name
        expect(current_path).to eq("/items/#{@item_1.id}")
      end
    end

    xit "they can see the top 5 most popular items by quantity purchased, plus the quantity bought" do

    end

    xit "they can see the 5 least popular items, plus the quantity bought" do

    end
  end
end
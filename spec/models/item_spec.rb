require "rails_helper"

RSpec.describe Item, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :image }
    it { should validate_inclusion_of(:active).in_array([true,false]) }
    it { should validate_presence_of :inventory }
  end

  describe "genders" do
    it "clothes can have an male fit" do
      item_1 = Item.create!(
        name: "Polo Shirt",
        description: "A fine fitting gingham pattern Polo Shirt from Ralph Lauren",
        price: 7499,
        image: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwj267SO6-rmAhVVXM0KHS7BBkwQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.macys.com%2Fshop%2Fproduct%2Fpolo-ralph-lauren-mens-classic-fit-cotton-gingham-shirt%3FID%3D6843975&psig=AOvVaw02HORLiBdkZejXTGu40nV7&ust=1578257929235413",
        active: true,
        inventory: 160,
        gender: 0
      )

      expect(item_1.gender).to eq("male")
      expect(item_1.male?).to be_truthy
    end

    it "clothes can have an female fit" do
      item_1 = Item.create!(
        name: "Polo Shirt",
        description: "A fine fitting gingham pattern Polo Shirt from Ralph Lauren",
        price: 7499,
        image: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwj267SO6-rmAhVVXM0KHS7BBkwQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.macys.com%2Fshop%2Fproduct%2Fpolo-ralph-lauren-mens-classic-fit-cotton-gingham-shirt%3FID%3D6843975&psig=AOvVaw02HORLiBdkZejXTGu40nV7&ust=1578257929235413",
        active: true,
        inventory: 160,
        gender: 1
      )

      expect(item_1.gender).to eq("female")
      expect(item_1.female?).to be_truthy
    end

    it "clothes can have an neutral fit" do
      item_1 = Item.create!(
        name: "Polo Shirt",
        description: "A fine fitting gingham pattern Polo Shirt from Ralph Lauren",
        price: 7499,
        image: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwj267SO6-rmAhVVXM0KHS7BBkwQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.macys.com%2Fshop%2Fproduct%2Fpolo-ralph-lauren-mens-classic-fit-cotton-gingham-shirt%3FID%3D6843975&psig=AOvVaw02HORLiBdkZejXTGu40nV7&ust=1578257929235413",
        active: true,
        inventory: 160,
        gender: 2
      )

      expect(item_1.gender).to eq("neutral")
      expect(item_1.neutral?).to be_truthy
    end
  end
end
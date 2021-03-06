user_default = User.create!(
  name: "default user",
  street_address: "514 Jones Cove",
  city: "Detroit",
  state: "Michigan",
  zip_code: 48071,
  email: "default@gmail.com",
  password: "password",
  password_confirmation: "password",
  role: 0
)
user_merchant = User.create!(
  name: "merchant user",
  street_address: "219 Jones Cove",
  city: "Atlanta",
  state: "Georgia",
  zip_code: 48071,
  email: "merchant@gmail.com",
  password: "password",
  password_confirmation: "password",
  role: 1
)
user_admin = User.create!(
  name: "admin user",
  street_address: "333 Jones Cove",
  city: "Des Moines",
  state: "Iowa",
  zip_code: 48071,
  email: "admin@gmail.com",
  password: "password",
  password_confirmation: "password",
  role: 2
)

item_1 = Item.create!(
  name: "Polo Shirt",
  description: "A fine fitting gingham pattern Polo Shirt from Ralph Lauren.",
  price: 7499,
  image: "https://www.rlmedia.io/is/image/PoloGSI/s7-1266692_lifestyle?$rl_506_630$",
  active: true,
  inventory: 160,
  gender: 0
)

item_2 = Item.create!(
  name: "Oxford Shirt",
  description: "The new mordern look for the modern man.",
  price: 8950,
  image: "https://www.rlmedia.io/is/image/PoloGSI/s7-1151198_lifestyle?$rl_506_630$",
  active: true,
  inventory: 143,
  gender: 0
)

item_3 = Item.create!(
  name: "Fringe-Trim Wool Sweater",
  description: "Fashionable and rustic, for those in touch with nature.",
  price: 44800,
  image: "https://www.rlmedia.io/is/image/PoloGSI/s7-1352117_lifestyle?$rl_506_630$",
  active: false,
  inventory: 90,
  gender: 1
)


# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])

Car.create([
  {
    name:"MODEL 3", image:"https://i.ibb.co/y6YVSjz/tesla2.png", brand:"Tesla", duration:200, total_amount_payable:500, option_to_purchase_fee:900
  },  {
    name:"MODEL X", image:"https://i.ibb.co/bv2ZfQX/tesla1.png", brand:"Tesla", duration:89, total_amount_payable:67, option_to_purchase_fee:900
  },
    {
    name:"MODEL S", image:"https://i.ibb.co/26M9fRg/tesla4.png", brand:"Tesla", duration:89, total_amount_payable:89, option_to_purchase_fee:899
  },
    {
    name:"MODEL Y", image:"https://i.ibb.co/SrSkx5X/tesla3.png", brand:"Tesla", duration:67, total_amount_payable:8989, option_to_purchase_fee:890
  },
    {
    name:"MODEL Y", image:"https://i.ibb.co/SrSkx5X/tesla3.png", brand:"Tesla", duration:67, total_amount_payable:8989, option_to_purchase_fee:890
  }
])

User.create(role: "admin", name: "admin", email: "admin@gmail.com", password: "111111")

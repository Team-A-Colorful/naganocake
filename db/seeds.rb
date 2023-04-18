# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'test@test.com',
  password: 'aaaaaa'
)
Customer.create!(
  first_name: '山田',
  last_name: '花子',
  first_name_kana: 'ヤマダ',
  last_name_kana: 'ハナコ',
  post_code: '0000000',
  address: 'aaa-bbb-ccc',
  telephone_number: '11122223333',
  membership_status: true,
  email: 'test@test.com',
  password: 'aaaaaa'
)
Genre.create!(
  name: 'ケーキ'
)
Item.create!(
  genre_id: 1,
  name: 'sample',
  introduction: 'test',
  price: '300',
  image: File.open("./app/assets/images/no_image.jpg"),
  sale_status: true
)
CartItem.create!(
  item_id: 1,
  customer_id: 1,
  count: 1
)
Order.create!(
  customer_id: 1,
  delivery_post_code: "1111111",
  delivery_address: "YYYYYYYYY",
  delivery_address_label: "鈴木香織",
  shipping_fee: 300,
  total_price: 1500,
  pay_option: "銀行振込",
  order_status: 1
)
OrderItem.create!(
  order_id: 1,
  item_id: 1,
  order_price: 400,
  count: 3,
  work_status: 1
)
ShippingAddress.create!(
  customer_id: 1,
  address_label: "田中一郎",
  post_code: "0000000",
  address: "XXXXXXXX"
)

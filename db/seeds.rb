# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

create_product_cmd = CreateProduct.new(name: 'iPhone', price: '20000', description: 'Hi-Phone es lo máximo')
product = create_product_cmd.execute
puts 'Created: ', product.inspect

discount_product_cmd = DiscountProductPrice.new(product, discount: 15)
new_product = discount_product_cmd.execute
puts 'Discounted price 15%: ', product.inspect

Category.destroy_all
category1 = Category.create({title: "One food"})
category2 = Category.create({title: "Two food"})
category3 = Category.create({title: "Three food"})


Product.destroy_all
product1 = Product.create({:title=>"tomato",description: "Description", category_id: category1.id, :price => 1})
product2 = Product.create({:title=>"milk",description: "Description", category_id: category1.id, :price => 3})
product3 = Product.create({:title=>"bread",description: "Description", category_id: category2.id, :price => 5.50})
product4 = Product.create({:title=>"bacon",description: "Description", category_id: category2.id, :price => 10})
product5 = Product.create({:title=>"cheese",description: "Description", category_id: category3.id, :price => 3.20})
product6 = Product.create({:title=>"woter",description: "Description", category_id: category3.id, :price => 2.20})

puts "Total number of products: #{Product.all.count}"
puts "Product titles: #{Product.all.pluck("title")}"
puts "Product1: #{product1.title} price: #{product1.price.round(2)} category: #{product1.category.title}"
puts "Product2: #{product2.title} price: #{product2.price.round(2)} category: #{product2.category.title}"
puts "Product3: #{product3.title} price: #{product3.price.round(2)} category: #{product3.category.title}"
puts "Product4: #{product4.title} price: #{product4.price.round(2)} category: #{product4.category.title}"
puts "Product5: #{product5.title} price: #{product5.price.round(2)} category: #{product5.category.title}"
puts "Product6: #{product6.title} price: #{product6.price.round(2)} category: #{product6.category.title}"

# CART
Cart.destroy_all
puts "\nTotal cart count: #{Cart.all.count}"
# Команда rails db:reset удалит базу данных и установит ее заново. Функционально это эквивалентно rails db:drop db:setup
# Команда rails db:setup создаст базу данных, загрузит схему и инициализирует ее с помощью данных seed.

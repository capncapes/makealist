require 'random_data'

# Create Users
15.times do
    User.create!(
        email: RandomData.random_email,
        password: RandomData.random_word + "abc"
    )
end

# Create Lists
20.times do
    List.create!(
        name: RandomData.random_name,
        description: RandomData.random_paragraph,
        list_type: ["basic", "product"].sample,
        private: [true, false].sample
    )
end
lists = List.all

# Create Products
100.times do
    Product.create!(
        list_id: lists.sample,
        name: RandomData.random_name,
        description: RandomData.random_paragraph,
        store1_name: RandomData.random_word.capitalize,
        store1_link: 'http://brandoncaples.com/',
        store1_price: RandomData.random_price,
        store2_name: RandomData.random_word.capitalize,
        store2_link: 'http://brandoncaples.com/',
        store2_price: RandomData.random_price,
        position: RandomData.random_rank
    )
end
products = Product.all

# Create Basics
100.times do
    Basic.create!(
        list_id: lists.sample,
        name: RandomData.random_name,
        description: RandomData.random_paragraph,
        position: RandomData.random_rank,
        todo: [true, false].sample
    )
end
basics = Basic.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Product.count} products created"
puts "#{Basic.count} basic list items created"
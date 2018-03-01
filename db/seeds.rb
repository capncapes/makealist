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
        private: [true, false].sample,
    )
end
lists = List.all

# Create Products
100.times do
    Product.create!(
        list: lists.sample,
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

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Product.count} products created"
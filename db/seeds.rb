# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Business.destroy_all

puts "Creating Users..."
# :username, :password, :first_name, :last_name, :suffix, :phone, :email
5.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    suffix = (rand(1..10).even? ? "" : Faker::Name.suffix)

    User.create(
        username: Faker::Internet.username(specifier: last_name), 
        password: "TODO", 
        first_name: first_name,
        last_name: last_name,
        suffix: suffix,
        phone: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email(
            name: "#{first_name.first} #{last_name}", 
            separators: "")
    )
end

puts "Creating Businesses..."
# :name, :address, :field, :description
10.times do
    Business.create(
        name: Faker::Company.name,
        address: Faker::Address.full_address,
        field: Faker::Company.industry,
        description: Faker::Lorem.paragraph
    )
end

puts "Done!"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

User.destroy_all
Business.destroy_all
Application.destroy_all
Contact.destroy_all
Conversation.destroy_all

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

puts "Creating Applications..."
8.times do
    if rand(1..10).even?
        wage_type = "Salary"
        wage = rand(50000..100000)
    else
        wage_type = "Hourly"
        wage = rand(30.0..45.0).round(2)
    end

    apply_date = DateTime.now.to_date - rand(1..3).months
    start_date = DateTime.now.to_date + rand(1..3).months

    Application.create(
        user: User.first, 
        business: Business.all.sample, 
        apply_date: apply_date, 
        start_date: start_date, 
        wage_type: wage_type, 
        wage: wage
    )
end

puts "Creating Contacts and Conversations"
10.times do
    application = Application.all.sample
    convo_date = application.apply_date + rand(1..3).weeks

    contact = Contact.create(
        # TODO: change seperate name columns like User
        application: application, 
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        profile_url: ""
    )

    rand(1..5).times do
        Conversation.create(
            contact: contact, 
            content: Faker::Lorem.paragraph, 
            contact_date: convo_date
        )
        convo_date = convo_date + rand(1..3).weeks
    end
end

puts "Done!"
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
            separators: ""
        )
    )
end

puts "Creating Businesses..."
# :name, :address, :field, :description

20.times do
    Business.create(
        user: User.all.sample,
        name: Faker::Company.name,
        address: Faker::Address.full_address,
        field: Faker::Company.industry,
        motto: Faker::Company.catch_phrase,
        about: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 3),
        description: Faker::Lorem.paragraph(sentence_count: 5, supplemental: false, random_sentences_to_add: 5)
    )
end

puts "Creating Applications..."
User.all.each do |user|
    rand(0..5).times do
        if rand(1..10).even?
            wage_type = "Salary"
            wage = rand(50000..100000)
        else
            wage_type = "Hourly"
            wage = rand(30.0..45.0).round(2)
        end

        apply_date = DateTime.now.to_date - rand(1..3).months
        start_date = DateTime.now.to_date + rand(1..3).months
        
        if !user.businesses.empty?
            Application.create(
                user_id: user.id, 
                business_id: user.businesses.sample.id, 
                apply_date: apply_date, 
                start_date: start_date, 
                wage_type: wage_type, 
                wage: wage
            )
        end
    end
    
end


puts "Creating Contacts and Conversations"
10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    suffix = (rand(1..10).even? ? "" : Faker::Name.suffix)

    application = Application.all.sample
    convo_date = application.apply_date + rand(1..3).weeks

    contact = Contact.create(
        application: application, 
        first_name: first_name,
        last_name: last_name,
        suffix: suffix, 
        email: Faker::Internet.email(
            name: "#{first_name.first} #{last_name}", 
            separators: ""
        ), 
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
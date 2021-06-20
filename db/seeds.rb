# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'date'

User.destroy_all
Experience.destroy_all
Project.destroy_all
Site.destroy_all

Business.destroy_all
Application.destroy_all

Contact.destroy_all
Conversation.destroy_all

puts "Creating Users..."
# :username, :password, :first_name, :last_name, :suffix, :phone, :email
exp_types = ["Certification", "Internship", "Acedemic", "Employment"]
sites = ["GitHub", "LinkedIn", "Indeed", "Medium", "Blog(personal site)"]

5.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    suffix = (rand(1..10).even? ? "" : Faker::Name.suffix)

    user = User.create(
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

    # Experience
    rand(1..5).times do
        comp_date = DateTime.now.to_date - rand(2..5).months
        type = exp_types.sample

        case exp_types.index(type)
        when 0
            title = "Certificate of... stuff... I Dunno I ran out of seed ideas ok!?"
        when 1
            title = "Internship at #{Faker::Company.name}"
        when 2
            title = Faker::Educator.degree
        when 3
            title = Faker::Job.title
        else
            "Oops..."
        end

        Experience.create(
            user: user,
            title: title,
            exp_type: type,
            description: Faker::Lorem.paragraph(sentence_count: 5, supplemental: false, random_sentences_to_add: 5),
            completion_date: comp_date
        )
    end
    # Projects
    rand(0..5).times do
        proj_date = DateTime.now.to_date - rand(2..5).months

        Project.create(
            user: user,
            name: Faker::Lorem.word,
            project_date: proj_date,
            completed: rand(1..10).even?
        )
    end
    # Sites
    rand(0..3).times do
        domain = sites.sample

        Site.create(
            user: user,
            domain: domain,
            url: "https://#{domain.downcase}.notreal/#{user.username}"
        )
    end
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

        words = ["opportunity", "position", "career"]
        role = Faker::Company.profession

        apply_date = DateTime.now.to_date - rand(1..3).months
        start_date = DateTime.now.to_date + rand(1..3).months
        
        if !user.businesses.empty?
            business = user.businesses.sample
            Application.create(
                user: user, 
                business: business,
                alias: "#{role} #{words.sample} at #{business.name}",
                role: role,
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
        if rand(1..10).even?
            author = application.user.full_name
        else
            author = contact.full_name
        end

        Conversation.create(
            contact: contact,
            author: author,
            content: Faker::Lorem.paragraph, 
            contact_date: convo_date
        )
        convo_date = convo_date + rand(1..3).weeks
    end
end

puts "Done!"
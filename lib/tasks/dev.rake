namespace :dev do
  desc "Configura o ambiente de dev"
  task setup: :environment do
    100.times do |i|
      Contact.create!(name:Faker::Name.name,
      email:Faker::Internet.email,
      birthdate:Faker::Date.between(75.years.ago, 18.years.ago))
    end
  end

end

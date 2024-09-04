namespace :dev do
  desc "Configura o ambiente de dev"
  task setup: :environment do
    puts "Resetando o banco de dados..."
    
    %x(rails db:drop db:create db:migrate)

    #########################

    puts "Cadastrando os tipos de contatos..."

    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind| 
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos de Contatos cadastrados com sucesso!"

    #########################

    puts "Cadastrando os contatos..."
    
    kinds = Kind.all

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 75.years.ago, to: 18.years.ago),
        kind_id: kinds.sample.id # Associando o ID de um tipo de contato aleatório a cada contato
      )
    end

    puts "Contatos cadastrados com sucesso!"

    #########################################################

    puts "Cadastrando os telefones..."
    Contact.all.each do |contact| 
      Random.rand(1..5).times do
        contact.phones.create!(number: Faker::PhoneNumber.cell_phone)
      end
    end

    puts "Telefones cadastrados com sucesso!"

    #########################################################

    puts "Cadastrando os endereços..."
    Contact.all.each do |contact| 
    Address.create(
      street: Faker::Address.street_address, 
      city: Faker::Address.city,
      contact: contact
     )
    end

    puts "Endereços cadastrados com sucesso!"

  end
end

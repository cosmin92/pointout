# This file should contain all the signalers records
# Signaler(first_name, last_name, phone, email, password, profile_picture, street, :number, city, zip_code, id_card_number, municipality, release_date, expiration_date)

@barba_rossa = Signaler.create(
    :first_name => "Barba",
    :last_name => "Rossa",
    :phone => "3455590812",
    :email => "barba.rossa@gmail.com",
    :password => "123456",
    :street => "via Domenico Tardini",
    :number => "35",
    :city => "Roma",
    :zip_code => "00167",
    :id_card_number => "AO1234567",
    :municipality => "Pescara",
    :release_date => DateTime.strptime("09/09/2016", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("09/09/2021", "%d/%m/%Y"),
    :profile_picture => File.open(File.join(Rails.root, "public/images/signalers/barba_rossa.jpeg"))
)

@mario_rossi = Signaler.create(
    :first_name => "Mario",
    :last_name => "Rossi",
    :phone => "3488234771",
    :email => "mario.rossi@gmail.com",
    :password => "123456",
    :street => "via Garibaldi",
    :number => "58",
    :city => "Chieti",
    :zip_code => "66010",
    :id_card_number => "AX7654321",
    :municipality => "Roma",
    :release_date => DateTime.strptime("11/10/2017", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("15/10/2022", "%d/%m/%Y"),
    :profile_picture => File.open(File.join(Rails.root, "public/images/signalers/mario_rossi.jpeg"))
)

@pinco_pallino = Signaler.create(
    :first_name => "Pinco",
    :last_name => "Pallino",
    :phone => "3284566612",
    :email => "pinco.pallino@gmail.com",
    :password => "123456",
    :street => "via Torre Vecchia",
    :number => "58",
    :city => "Firenze",
    :zip_code => "702245",
    :id_card_number => "XAO345457",
    :municipality => "Verona",
    :release_date => DateTime.strptime("21/10/2015", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("29/10/2020", "%d/%m/%Y"),
    :profile_picture => File.open(File.join(Rails.root, "public/images/signalers/pinco_pallino.jpeg"))
)

@pippo_baldo = Signaler.create(
    :first_name => "Pippo",
    :last_name => "Baldo",
    :phone => "3584556892",
    :email => "pippo.baldo@gmail.com",
    :password => "123456",
    :street => "via Gregorio VII",
    :number => "27",
    :city => "Napoli",
    :zip_code => "702245",
    :id_card_number => "XAO347612",
    :municipality => "Latina",
    :release_date => DateTime.strptime("21/10/2015", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("29/10/2020", "%d/%m/%Y"),
    :profile_picture => File.open(File.join(Rails.root, "public/images/signalers/pippo_baldo.jpeg"))
)


@maria_antonietta = Signaler.create(
    :first_name => "Maria",
    :last_name => "Antonietta",
    :phone => "3581056892",
    :email => "maria.antonietta@gmail.com",
    :password => "123456",
    :street => "via Urbano III",
    :number => "59",
    :city => "Milano",
    :zip_code => "70234",
    :id_card_number => "BAO345457",
    :municipality => "Roma",
    :release_date => DateTime.strptime("21/10/2015", "%d/%m/%Y"),
    :expiration_date => DateTime.strptime("29/10/2020", "%d/%m/%Y"),
    :profile_picture => File.open(File.join(Rails.root, "public/images/signalers/maria_antonietta.jpeg"))
)
# This file should contain all forwarders records
# Forwarder(first_name, last_name, email, password, boss, profile_picture, group)

@isaac_newton = Forwarder.create(
    :first_name => "Isaac",
    :last_name => "newton",
    :email => "isaac.newton@gmail.com",
    :password => "123456",
    :profile_picture => File.open(File.join(Rails.root, "public/images/forwarders/isaac_newton.jpg")),
    :boss => true,
    :group => @i_fantastici
)

@galileo_galilei = Forwarder.create(
    :first_name => "Galileo",
    :last_name => "Galilei",
    :email => "galileo.galilei@gmail.com",
    :password => "123456",
    :profile_picture => File.open(File.join(Rails.root, "public/images/forwarders/galileo_galilei.jpg")),
    :boss => true,
    :group => @i_fantastici
)

@giulio_cesare = Forwarder.create(
    :first_name => "Giulio",
    :last_name => "Cesare",
    :email => "giulio.cesare@gmail.com",
    :password => "123456",
    :profile_picture => File.open(File.join(Rails.root, "public/images/forwarders/giulio_cesare.jpg")),
    :boss => true,
    :group => @pirati_di_montagna
)

@carlo_magno = Forwarder.create(
    :first_name => "Carlo",
    :last_name => "Magno",
    :email => "carlo.magno@gmail.com",
    :password => "123456",
    :profile_picture => File.open(File.join(Rails.root, "public/images/forwarders/carlo_magno.jpg")),
    :boss => true,
    :group => @scudo_rosso
)

@giovanni_giolitti = Forwarder.create(
    :first_name => "Giovanni",
    :last_name => "Giolitti",
    :email => "giovanni.giolitti@gmail.com",
    :password => "123456",
    :profile_picture => File.open(File.join(Rails.root, "public/images/forwarders/giovanni_giolitti.jpeg")),
    :group => @scudo_rosso
)

@oriana_fallaci = Forwarder.create(
    :first_name => "Oriana",
    :last_name => "Fallaci",
    :email => "goriana.fallaci@gmail.com",
    :password => "123456",
    :profile_picture => File.open(File.join(Rails.root, "public/images/forwarders/oriana_fallaci.jpg")),
    :group => @scudo_rosso
)

@rita_levi_montalcini = Forwarder.create(
    :first_name => "Rita Levi",
    :last_name => "Montalicini",
    :email => "rita.levi.montalcini@gmail.com",
    :password => "123456",
    :profile_picture => File.open(File.join(Rails.root, "public/images/forwarders/rita_levi_montalcini.jpeg")),
    :group => @i_fantastici
)

@maria_montessori = Forwarder.create(
    :first_name => "Maria",
    :last_name => "Montessori",
    :email => "maria.montessori@gmail.com",
    :password => "123456",
    :profile_picture => File.open(File.join(Rails.root, "public/images/forwarders/maria_montessori.jpg")),
    :group => @pirati_di_montagna
)
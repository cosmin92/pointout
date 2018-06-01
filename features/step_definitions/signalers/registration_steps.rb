Dato("che sono nella pagina di creazione di un nuovo account segnalatore") do
  visit('/signalers/sign_up')
end

Quando("inserisco il nome {string} nel campo nome del form di registrazione come segnalatore") do |nome|
  fill_in "signaler[first_name]", :with => nome
end

Quando("inserisco il cognome {string} nel campo cognome del form di registrazione come segnalatore") do |cognome|
  fill_in "signaler[last_name]", :with => cognome
end

Quando("inserisco il la mail {string} nel campo email del form di registrazione come segnalatore") do |email|
  fill_in "signaler[email]", :with =>  email
end

Quando("inserisco il numero di telefono {string} nel campo telefono del form di registrazione come segnalatore") do |telefono|
  fill_in "signaler[phone]", :with => telefono
end

Quando("inserisco la password {string} nel campo password del form di registrazione come segnalatore") do |password|
  fill_in "signaler[password]", :with => password
end

Quando("inserisco la password {string} nel campo password di conferma del form di registrazione come segnalatore") do |password|
  fill_in "signaler[password_confirmation]", :with => password
end

Quando("inserisco il nome della via di residenza {string} nel campo via del form di registrazione come segnalatore") do |via|
  fill_in "signaler[street]", :with => via
end

Quando("inserisco il numero civico di residenza {string} nel campo numero civico del form di registrazione come segnalatore") do |numero_civico|
  fill_in "signaler[number]", :with => numero_civico
end

Quando("inserisco il nome della città di residenza {string} nel campo città del form di registrazione come segnalatore") do |citta|
  fill_in "signaler[city]", :with => citta
end

Quando("inserisco il CAP della zona di residenza {string} nel campo CAP del form di registrazione come segnalatore") do |cap|
  fill_in "signaler[zip_code]", :with => cap
end

Quando("inserisco il numero della carta di identità {string} nel campo numero del form di registrazione come segnalatore") do |numero|
  fill_in "signaler[id_card_number]", :with => numero
end

Quando("inserisco il nome del comune di rilascio della carta di identità {string} nel campo comune del form di registrazione come segnalatore") do |comune|
  fill_in "signaler[municipality]", :with => comune
end

Quando("inserisco la data di rilascio della carta di identità {string} nel campo data di rilascio del form di registrazione come segnalatore") do |data|
  page.find('#signaler_release_date').set(data)
end

Quando("inserisco la data di scadenza della carta di identità {string} nel campo data di scadenza del form di registrazione come segnalatore") do |data|
  page.find('#signaler_expiration_date').set(data)
end

Quando("invio clicco sul pulsante registra per inviare il form") do
  click_button("Register")
end

Allora("devo vedere un messaggio che mi dica che la reggistrazione è avvenuta con successo") do
  pending # Write code here that turns the phrase above into concrete actions
end

Allora("devo vedere il nome {string}") do |nome|
  expect(page).to have_content(nome)
end

Allora("devo vedere il cognome {string}") do |cognome|
  expect(page).to have_content(cognome)
end

Allora("devo vedere la mail {string}") do |email|
  expect(page).to have_content(email)
end

Allora("devo vedere il numero di telefono {string}") do |telefono|
  expect(page).to have_content(telefono)
end

Allora("devo vedere il nome della via di residenza {string}") do |via|
  expect(page).to have_content(via)
end

Allora("devo vedere il numero civico di residenza {string}") do |numero_civico|
  expect(page).to have_content(numero_civico)
end

Allora("devo vedere il nome della città di residenza {string}") do |citta|
  expect(page).to have_content(citta)
end

Allora("devo vedere il CAP della zona di residenza {string}") do |cap|
  expect(page).to have_content(cap)
end

Allora("devo vedere il numero della carta di identità {string}") do |numero|
  expect(page).to have_content(numero)
end

Allora("devo vedere il nome del comune di rilascio della carta di identità {string}") do |comune|
  expect(page).to have_content(comune)
end

Allora("devo vedere la data di scadenza della carta di identità {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Allora("non devo vedere la password {string}") do |password|
  expect(page).not_to have_content(password)
end

Allora("devo vedere la data di rilascio della carta di identità {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Allora("la registrazione deve fallire e devo essere informato sulla causa del fallimento") do
  pending # Write code here that turns the phrase above into concrete actions
end

Allora("devo essere indirizzato di nuovo verso la pagina di registrazione di un segnalatore") do
  pending # Write code here that turns the phrase above into concrete actions
end

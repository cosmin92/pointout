Dato("che mi sono precedentemente registrato e sono uno segnalatore con nome {string}, cognome {string} email {string}, password {string} e telefono {string}") do |nome, cognome, email, password, telefono|
  visit('/signalers/sign_up')
  fill_in "signaler[first_name]", :with => nome
  fill_in "signaler[last_name]", :with => cognome
  fill_in "signaler[email]", :with => email
  fill_in "signaler[phone]", :with => telefono
  fill_in "signaler[password]", :with => password
  fill_in "signaler[password_confirmation]", :with => password
end

Dato("sono residente in {string}, numero {string}, città {string}, CAP {string}") do |via, numero_civico, citta, cap|
  fill_in "signaler[street]", :with => via
  fill_in "signaler[number]", :with => numero_civico
  fill_in "signaler[city]", :with => citta
  fill_in "signaler[zip_code]", :with => cap
end

Dato("la mia carta di identità con numero {string}, rilasciata dal comune di {string} il {string} scade il {string}") do |numero, comune, data_rilascio, data_scadenza|
  fill_in "signaler[id_card_number]", :with => numero
  fill_in "signaler[municipality]", :with => comune
  page.find('#signaler_release_date').set(data_rilascio)
  page.find('#signaler_expiration_date').set(data_scadenza)
end

Dato("ho effettuato lo accesso come segnalatore") do
  click_button("Register")
end

Dato("sono nella pagina modifica del profilo segnalatore") do
  visit(edit_signaler_registration_path)
  expect(page.current_path).to eq(edit_signaler_registration_path)
end

Quando("inserisco {string} nel campo nome del form di aggiornamento del profilo di uno segnalatore") do |nome|
  if nome.length != 0
    fill_in "signaler[first_name]", :with => nome
  end
end

Quando("inserisco {string} nel campo cognome del form di aggiornamento del profilo di uno segnalatore") do |cognome|
  if cognome.length != 0
    fill_in "signaler[last_name]", :with => cognome
  end
end

Quando("inserisco {string} nel campo email del form di aggiornamento del profilo di uno segnalatore") do |email|
  if email.length != 0
    fill_in "signaler[email]", :with => email
  end
end

Quando("inserisco {string} nel campo telefono del form di aggiornamento del profilo di uno segnalatore") do |telefono|
  if telefono.length != 0
    fill_in "signaler[phone]", :with => telefono
  end
end

Quando("inserisco {string} sia nel campo nuova password sia nel campo passowrd di conferma del form di aggiornamento del profilo di uno segnalatore") do |password|
  if password.length != 0
    fill_in "signaler[password]", :with => password
    fill_in "signaler[password_confirmation]", :with => password
  end
end

Quando("inserisco {string} nel campo password del form di aggiornamento del profilo di uno segnalatore") do |password|
  fill_in "signaler[current_password]", :with => password
end

Quando("inserisco {string} nel campo via di residenza del form di aggiornamento del profilo di uno segnalatore") do |via|
  if via.length != 0
    fill_in "signaler[street]", :with => via
  end
end

Quando("inserisco {string} nel campo numero civico di residenza del form di aggiornamento del profilo di uno segnalatore") do |numero_civico|
  if numero_civico.length != 0
    fill_in "signaler[number]", :with => numero_civico
  end
end

Quando("inserisco {string} nel campo città di residenza del form di aggiornamento del profilo di uno segnalatore") do |citta|
  if citta.length != 0
    fill_in "signaler[city]", :with => citta
  end
end

Quando("inserisco {string} nel campo CAP della zona di residenza del form di aggiornamento del profilo di uno segnalatore") do |cap|
  if cap.length != 0
    fill_in "signaler[zip_code]", :with => cap
  end
end

Quando("inserisco {string} nel campo numero carta di identità  del form di aggiornamento del profilo di uno segnalatore") do |numero|
  if numero.length != 0

    fill_in "signaler[id_card_number]", :with => numero
  end
end

Quando("inserisco {string} nel campo comune di rilascio della carta di identità  del form di aggiornamento del profilo di uno segnalatore") do |comune|
  if comune.length != 0
    fill_in "signaler[municipality]", :with => comune
  end
end

Quando("invio il form con i dati aggiornati") do
  click_button("Update")
end

Allora("dovrei essere indirizzato alla pagina del mio profilo e vedere un messaggio che mi dica che la modifica è avvenuta con successo") do
  expect(page.current_path).to eq(signalers_profile_path)
end

Allora("dovrei vedere il mio profilo aggiornato") do

end

Quando("inserisco {string} e  {string} rispettivamente nei campi data di scadenza e di rilascio del form di aggiornamento del profilo di uno segnalatore") do |data_r, data_e|
  page.find('#signaler_release_date').set(data_r)
  page.find('#signaler_expiration_date').set(data_e)
end

Quando("inserisco {string} nel campo nuova password del form di aggiornamento del profilo di uno segnalatore") do |password|
  fill_in "signaler[password]", :with => password
end

Quando("inserisco {string} nel campo password di conferma del form di aggiornamento del profilo di uno segnalatore") do |password|
  fill_in "signaler[password_confirmation]", :with => password
end

Allora("la modifica non deve andare a buon fine e dovrei vedere la pagina di aggionamento") do
  expect(page.current_path).to eq("/signalers")
end

Quando("inserisco {string} e {string} rispetivamente nel campo data di rilascio e data di scadenza della carta di di identità") do |data_rilascio, data_scadenza|
  page.find('#signaler_release_date').set(data_rilascio+"asd")
  page.find('#signaler_expiration_date').set(data_scadenza)
end

Quando("inserisco una password {string} nel campo password del form di aggiornamento del profilo di uno segnalatore") do |password|
  fill_in "signaler[current_password]", :with => password
end

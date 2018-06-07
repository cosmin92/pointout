World(Devise::Test::ControllerHelpers)

Dato("che mi sono registrato come signalatore con {string}, {string},{string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}") do |nome, cognome, email, telefono, password, via, numero, citta, cap, id, comune, data_rilascio, data_scadenza|
  visit("/signalers/sign_up")
  @signaler = Signaler.create(
      :first_name => nome,
      :last_name => cognome,
      :email => email,
      :phone => telefono,
      :street => via,
      :number => numero,
      :city => citta,
      :zip_code => cap,
      :id_card_number => id,
      :municipality => comune,
      :release_date => data_rilascio,
      :expiration_date => data_scadenza
  )

  fill_in('signaler[first_name]', with: nome)
  fill_in('signaler[last_name]', with: cognome)

  fill_in('signaler[phone]', with: telefono)
  fill_in('signaler[email]', with: email)
  fill_in('signaler[password]', with: password)
  fill_in('signaler[password_confirmation]', with: password)


  fill_in('signaler[street]', with: via)
  fill_in('signaler[number]', with: numero)
  fill_in('signaler[city]', with: citta)
  fill_in('signaler[zip_code]', with: cap)

  fill_in('signaler[id_card_number]', with: id)
  fill_in('signaler[municipality]', with: comune)
  fill_in('signaler[release_date]', with: data_rilascio)
  fill_in('signaler[expiration_date]', with: data_scadenza)
  click_button('Register')
end

Dato("non ho una sessione aperta") do
  page.driver.submit :delete, destroy_signaler_session_path, {}
end

Dato("sono nella pagina di accesso per un segnalatore") do
  visit("/signalers/sign_in")
end

Quando("inserisco {string} nel campo email del form di accesso come segnalatore") do |email|
  fill_in('signaler[email]', with: email)
end

Quando("inserisco {string} nel campo password del form di accesso come segnalatore") do |password|
  fill_in('signaler[password]', with: password)
end

Quando("clicco sul pulsante accedi per inviare il form") do
  click_on("Login")
end

Allora("devo essere indirizzato verso la pagina home") do
  expect(page.current_path).to eq(root_path)
end

Allora("mi deve essere negato lo accesso e devo vedere un messaggio di errore sul relativo campo invalido") do
  expect(page.current_path).to eq(new_signaler_session_path)
end
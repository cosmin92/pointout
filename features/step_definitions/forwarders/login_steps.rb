Dato("che mi sono registrato come addetto allo inoltro con {string}, {string},{string} e {string}") do |nome, cognome, email, password|
  create(:group)
  visit("backend/forwarders/sign_up")
  fill_in('forwarder[first_name]', with: nome)
  fill_in('forwarder[last_name]', with: cognome)

  fill_in('forwarder[email]', with: email)
  fill_in('forwarder[password]', with: password)
  fill_in('forwarder[password_confirmation]', with: password)
  click_button('Register')
end

Dato("non ho una sessione aperta da addetto allo inoltro") do
  page.driver.submit :delete, destroy_forwarder_session_path, {}
end

Dato("sono nella pagina di accesso per un addetto allo inoltro") do
  visit("backend/forwarders/sign_in")
end

Quando("inserisco {string} nel campo email del form di accesso come addetto allo inoltro") do |email|
  fill_in('forwarder[email]', with: email)
end

Quando("inserisco {string} nel campo password del form di accesso come addetto allo inoltro") do |password|
  fill_in('forwarder[password]', with: password)
end

Allora("mi deve essere negato lo accesso e devo vedere un messaggio di errore sul relativo campo invalido del addetto allo inoltro") do
  expect(page.current_path).to eq(new_forwarder_session_path)
end
Allora("devo essere indirizzato verso la pagina root") do

end



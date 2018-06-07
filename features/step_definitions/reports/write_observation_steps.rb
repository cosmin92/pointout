Dato("che esiste una segnalazione nel sistema") do
  @report = create(:report, :tipology => Tipology.first, :signaler => Signaler.first)
end

Dato("sono nella pagina di visualizazione dei questa segnalazione") do
  visit("/reports/#{Report.last.id}")
  expect(page.current_path).to eq("/reports/#{Report.last.id}")
end

Quando("sinserisco {string} nel campo contenuto del form di creazione di una nuova osservazione") do |contenuto|
  fill_in "observation[content]", :with => contenuto
end

Quando("inserisco {string} nel campo tags del form di creazione di una nuova osservazione") do |tags|
  fill_in "observation[tag_list]", :with => tags
end

Quando("invio il form di creazione di una nuova osservazione") do
  click_button("Submit")
end

Allora("devo esse indirizzato versa la paggina di registrazione della stessa segnalazione") do
  expect(page.current_path).to eq("/reports/#{Report.last.id}")
end

Allora("devo vedere la osservazione appena creata con contenuto {string}") do |contenuto|
  expect(page).to have_content(contenuto)
end

Quando("non sono auteticato come segnalatore") do
  click_link('Logout')
  visit("/reports/#{Report.last.id}")
end

Allora("devo essere iondirizzato verso la pagina di autenticazione di un nuovo segnalatore") do
  expect(page.current_path).to eq(new_signaler_session_path)
end

Allora("se effettuato lo asccesso e vado nella pagina di visualizazione della stessa segnalazione") do
  fill_in "signaler[email]", :with => "p.pallino@gmail.com"
  fill_in "signaler[password]", :with => "passwordsicura"
  click_on("Login")
  visit("/reports/#{Report.last.id}")
end

Allora("se inserisco {string} nel campo contenuto del form di creazione di una nuova osservazione") do |contenuto|
  fill_in "observation[content]", :with => contenuto
end

Allora("se inserisco {string} nel campo tags del form di creazione di una nuova osservazione") do |tags|
  fill_in "observation[tag_list]", :with => tags
end

Allora("reinvio il form di creazione di una nuova osservazione") do
  click_button("Submit")
end

Allora("inserisco la {string} nel campo contenuto del form di creazione di una nuova osservazione") do |contenuto|
    fill_in "observation[content]", :with => contenuto
end

Quando("inserisco {string} nel campo contenuto del form di creazione di una nuova osservazione") do |contenuto|
  fill_in "observation[content]", :with => contenuto
end

Allora("se inserisco la {string} nel campo contenuto del form di creazione di una nuova osservazione") do |contenuto|
  fill_in "observation[content]", :with => contenuto
end


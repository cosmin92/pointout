Dato("sono nella pagina di creazione di una nuova segnalazione") do
  visit(new_report_path)
  expect(page.current_path).to eq(new_report_path)
end

Dato("dato che esite una tipologia di problemi di nome {string}") do |nome|
  @tipology = create(:tipology, :name => nome)
  expect(Tipology.all.count).to eq(1)
end

Quando("inserisco {string} nel campo oggetto del form di creazione di un nuovo report") do |oggetto|
  if oggetto.length != 0
    fill_in "report[object]", :with => oggetto
  end
end

Quando("inserisco {string} nel campo descrizione del form di creazione di un nuovo report") do |descrizione|
  if descrizione.length != 0
    fill_in "report[description]", :with => descrizione
  end
end

Quando("inserisco {string} nel campo tags del form di creazione di un nuovo report") do |tags|
  fill_in "report[tag_list]", :with => tags
end

Quando("inserisco {string} nel campo indirizzo del form di creazione di un nuovo report") do |indirizzo|
  if indirizzo.length != 0
    fill_in "report[address]", :with => indirizzo
    fill_in "report[longitude]", :with => 12.440732499999967
    fill_in "report[latitude]", :with => 41.8963232
  end
end

Quando("scelgo il tipo di segnalazioe reclamo dal form di creazione di un nuovo report") do
  choose('report[report_type]', option: 'Complaint')
end

Quando("scelgo il tipo di intervento correttivo dal form di creazione di un nuovo report") do
  choose('report[intervention_type]', option: 'Corrective')
end

Quando("indico che si deve intrvenire immediatamente sul sulla problematica") do
  choose('intervention_type_Immediate')
end

Quando("scelgo la tipologia {string} nel campo tipologia del form di creazione di un nuovo report") do |tipologia|
  #select "1", :from => "report[tipology_id]"
  #page.select(@tipology.id, :from => "report[tipology_id]")
  find('select#tipology').find("option[value='#{@tipology.id}']").select_option
  expect(page).to have_content(tipologia)
end

Quando("invio il modulo di creazione di un nuova segnalazione") do
  click_button("Send")
end

Allora("dovrei essere indirizzato nella pagina di visualizzazione del report appena inviato") do
  expect(page.current_path).to eq("/reports/#{Report.last.id}")
end

Allora("dovrei almeno vedere l'oggetto {string}") do |oggetto|
  expect(page).to have_content(oggetto)
end

Allora("dovrei vedere la descrizione {string}") do |descrizione|
  expect(page).to have_content(descrizione)
end

Allora("lo invio non deve andare a buon fine e dovrei vedere di nuovo la pagina di creazione di una segnalazione") do
  expect(page.current_path).to eq(new_report_path)
end


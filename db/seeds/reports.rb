# This file should contain all the reports records
# Report(object, description, address, longitude, latitude, report_type, intervention_type, state, signaler, tipology, forwarder, agency)

@buche_sulla_strada = Report.create(
    :object => "Buche sulla strada",
    :description => "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
    :address => "Via Domenico Tardini, 35, 00167 Roma RM",
    :longitude => 12.425314,
    :latitude => 41.907033,
    :report_type => "Segnalation",
    :intervention_type => "Corrective",
    :signaler => @barba_rossa,
    :tipology => @ambiente,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img1.png")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img2.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img3.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img4.jpg"))
    ]
)

# 500 metri distante dal palo rotto
@palo_luce_rotto = Report.create(
    :object => "Palo luce rotto",
    :description => "Al contrario di quanto si pensi, Lorem Ipsum non è semplicemente una sequenza casuale di caratteri. Risale ad un classico della letteratura latina del 45 AC, cosa che lo rende vecchio di 2000 anni. Richard McClintock, professore di latino al Hampden-Sydney College in Virginia, ha ricercato una delle più oscure parole latine, consectetur, da un passaggio del Lorem Ipsum e ha scoperto tra i vari testi in cui è citata, la fonte da cui è tratto il testo, le sezioni 1.10.32 and 1.10.33 del \"de Finibus Bonorum et Malorum\" di Cicerone. Questo testo è un trattato su teorie di etica, molto popolare nel Rinascimento. La prima riga del Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", è tratta da un passaggio della sezione 1.10.32. Il brano standard del Lorem Ipsum usato sin dal sedicesimo secolo è riprodotto qui di seguito per coloro che fossero interessati. Anche le sezioni 1.10.32 e 1.10.33 del \"de Finibus Bonorum et Malorum\" di Cicerone sono riprodotte nella loro forma originale, accompagnate dalla traduzione inglese del 1914 di H. Rackham.",
    :address => "Via Domenico Tardini, 40, 00167 Roma RM",
    :longitude => 12.425956,
    :latitude => 41.902905,
    :report_type => "Segnalation",
    :intervention_type => "Corrective",
    :signaler => @pinco_pallino,
    :tipology => @illuminazione_stradale,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/illuminazione_stradale/img1.jpeg")),
        File.open(File.join(Rails.root, "public/images/reports/illuminazione_stradale/img2.jpeg")),
        File.open(File.join(Rails.root, "public/images/reports/illuminazione_stradale/img3.jpeg")),
    ]
)

# 500 metri distante dal palo rotto
@rifiuti = Report.create(
    :object => "Rifiuti",
    :description => "È universalmente riconosciuto che un lettore che osserva il layout di una pagina viene distratto dal contenuto testuale se questo è leggibile. Lo scopo dell’utilizzo del Lorem Ipsum è che offre una normale distribuzione delle lettere (al contrario di quanto avviene se si utilizzano brevi frasi ripetute, ad esempio “testo qui”), apparendo come un normale blocco di testo leggibile. Molti software di impaginazione e di web design utilizzano Lorem Ipsum come testo modello. Molte versioni del testo sono state prodotte negli anni, a volte casualmente, a volte di proposito (ad esempio inserendo passaggi ironici).",
    :address => "Via Quirino Majorana, 200, 00146 Roma RM",
    :longitude => 12.464055,
    :latitude => 41.866281,
    :report_type => "Complaint",
    :intervention_type => "Preventive",
    :signaler => @mario_rossi,
    :tipology => @rifiuti_pulizia,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/rifiuti/img1.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/rifiuti/img2.jpeg")),
        File.open(File.join(Rails.root, "public/images/reports/rifiuti/img3.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/rifiuti/img4.jpeg")),
        File.open(File.join(Rails.root, "public/images/reports/rifiuti/img5.jpg"))
    ]
)

@randagismo_pescara = Report.create(
    :object => "Cani randaggi a Pescara centrale",
    :description => "È universalmente riconosciuto che un lettore che osserva il layout di una pagina viene distratto dal contenuto testuale se questo è leggibile. Lo scopo dell’utilizzo del Lorem Ipsum è che offre una normale distribuzione delle lettere (al contrario di quanto avviene se si utilizzano brevi frasi ripetute, ad esempio “testo qui”), apparendo come un normale blocco di testo leggibile. Molti software di impaginazione e di web design utilizzano Lorem Ipsum come testo modello. Molte versioni del testo sono state prodotte negli anni, a volte casualmente, a volte di proposito (ad esempio inserendo passaggi ironici).",
    :address => "Via Bologna, 10, 66010 Pescara PE",
    :longitude => 14.215113,
    :latitude => 42.466419,
    :report_type => "Complaint",
    :intervention_type => "Corrective",
    :signaler => @mario_rossi,
    :tipology => @randagismo,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/randagismo_pescara/img1.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/randagismo_pescara/img2.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/randagismo_pescara/img3.jpg")),
    ]
)
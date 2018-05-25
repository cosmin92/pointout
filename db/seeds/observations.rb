# This file should contain all observations recorda
# Observation(content, report, signaler)

@o1_buche_sulla_strada = Observation.create(
    :content => "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
    :signaler => @barba_rossa,
    :report => @buche_sulla_strada,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img1.png")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img2.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img3.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img4.jpg"))
    ]
)

@o2_buche_sulla_strada = Observation.create(
    :content => "Al contrario di quanto si pensi, Lorem Ipsum non è semplicemente una sequenza casuale di caratteri. Risale ad un classico della letteratura latina del 45 AC, cosa che lo rende vecchio di 2000 anni. Richard McClintock, professore di latino al Hampden-Sydney College in Virginia, ha ricercato una delle più oscure parole latine, consectetur, da un passaggio del Lorem Ipsum e ha scoperto tra i vari testi in cui è citata, la fonte da cui è tratto il testo, le sezioni 1.10.32 and 1.10.33 del \"de Finibus Bonorum et Malorum\" di Cicerone. Questo testo è un trattato su teorie di etica, molto popolare nel Rinascimento. La prima riga del Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", è tratta da un passaggio della sezione 1.10.32. Il brano standard del Lorem Ipsum usato sin dal sedicesimo secolo è riprodotto qui di seguito per coloro che fossero interessati. Anche le sezioni 1.10.32 e 1.10.33 del \"de Finibus Bonorum et Malorum\" di Cicerone sono riprodotte nella loro forma originale, accompagnate dalla traduzione inglese del 1914 di H. Rackham.",
    :signaler => @pinco_pallino,
    :report => @buche_sulla_strada,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img1.png")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img2.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img3.jpg")),
    ]
)

@o1_palo_luce_rotto = Observation.create(
    :content => "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
    :signaler => @barba_rossa,
    :report => @palo_luce_rotto,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img1.png")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img2.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img3.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img4.jpg"))
    ]
)

@o2_palo_luce_rotto = Observation.create(
    :content => "Al contrario di quanto si pensi, Lorem Ipsum non è semplicemente una sequenza casuale di caratteri. Risale ad un classico della letteratura latina del 45 AC, cosa che lo rende vecchio di 2000 anni. Richard McClintock, professore di latino al Hampden-Sydney College in Virginia, ha ricercato una delle più oscure parole latine, consectetur, da un passaggio del Lorem Ipsum e ha scoperto tra i vari testi in cui è citata, la fonte da cui è tratto il testo, le sezioni 1.10.32 and 1.10.33 del \"de Finibus Bonorum et Malorum\" di Cicerone. Questo testo è un trattato su teorie di etica, molto popolare nel Rinascimento. La prima riga del Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", è tratta da un passaggio della sezione 1.10.32. Il brano standard del Lorem Ipsum usato sin dal sedicesimo secolo è riprodotto qui di seguito per coloro che fossero interessati. Anche le sezioni 1.10.32 e 1.10.33 del \"de Finibus Bonorum et Malorum\" di Cicerone sono riprodotte nella loro forma originale, accompagnate dalla traduzione inglese del 1914 di H. Rackham.",
    :signaler => @pinco_pallino,
    :report => @palo_luce_rotto,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img1.png")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img2.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img3.jpg")),
    ]
)

@o1_rifiuti = Observation.create(
    :content => "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
    :signaler => @barba_rossa,
    :report => @rifiuti,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img1.png")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img2.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img3.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img4.jpg"))
    ]
)

@o2_rifiuti = Observation.create(
    :content => "Al contrario di quanto si pensi, Lorem Ipsum non è semplicemente una sequenza casuale di caratteri. Risale ad un classico della letteratura latina del 45 AC, cosa che lo rende vecchio di 2000 anni. Richard McClintock, professore di latino al Hampden-Sydney College in Virginia, ha ricercato una delle più oscure parole latine, consectetur, da un passaggio del Lorem Ipsum e ha scoperto tra i vari testi in cui è citata, la fonte da cui è tratto il testo, le sezioni 1.10.32 and 1.10.33 del \"de Finibus Bonorum et Malorum\" di Cicerone. Questo testo è un trattato su teorie di etica, molto popolare nel Rinascimento. La prima riga del Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", è tratta da un passaggio della sezione 1.10.32. Il brano standard del Lorem Ipsum usato sin dal sedicesimo secolo è riprodotto qui di seguito per coloro che fossero interessati. Anche le sezioni 1.10.32 e 1.10.33 del \"de Finibus Bonorum et Malorum\" di Cicerone sono riprodotte nella loro forma originale, accompagnate dalla traduzione inglese del 1914 di H. Rackham.",
    :signaler => @mario_rossi,
    :report => @rifiuti,
    :images => [
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img1.png")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img2.jpg")),
        File.open(File.join(Rails.root, "public/images/reports/buche_sulla_strada/img3.jpg")),
    ]
)
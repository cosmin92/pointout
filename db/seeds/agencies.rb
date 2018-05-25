# This file should contain all agencies records
# Agency(name, note, phone, email, fax, street, number, city, zip_code, web_site_url, forwarder)

@anas_spa_direzione_centrale = Agency.create(
    :name => "Anas S.p.A. Direzione Centrale",
    :note => "Suspendisse pretium, lectus non luctus imperdiet, metus dolor vulputate sem, quis commodo erat nulla in orci. Suspendisse ornare sed risus nec tincidunt. Nam rhoncus ante eu nulla suscipit ornare ac quis urna. Duis convallis ante urna, et dictum sapien rutrum quis.",
    :phone => "0644461",
    :email => "anas.direzionecentrale@gmail.com",
    :fax => "0644461",
    :street => "via Monzambano",
    :number => "10",
    :city => "Roma",
    :zip_code => "00159",
    :web_site_url => "http://www.stradeanas.it/it",
    :forwarder => @isaac_newton
)

@anas_spa_autoparco_della_direzione_generale = Agency.create(
    :name => "Anas S.p.A. - Autoparco della Direzione Generale",
    :note => "Suspendisse sed odio varius, laoreet arcu vitae, semper nibh. Aliquam ut porttitor ligula. Duis et ante sed diam iaculis consectetur vitae eu tortor. Nunc eu nisl sed est vehicula venenatis ut fermentum est. Quisque vitae odio ante. ",
    :phone => "064416431",
    :email => "anas.dgenerale@gmail.com",
    :fax => "064416431",
    :street => "via Alessandrina",
    :number => "200",
    :city => "Roma",
    :zip_code => "00146",
    :web_site_url => "http://www.stradeanas.it/it",
    :forwarder => @galileo_galilei
)

@ama_sede_di_zona = Agency.create(
    :name => "AMA sede di zona",
    :note => "Nullam tellus mi, pulvinar vel ligula et, pharetra placerat lacus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
    :phone => "800867035",
    :email => "amasedezona@gmail.com",
    :fax => "800867035",
    :street => "via Sabotino",
    :number => "4",
    :city => "Roma",
    :zip_code => "00789",
    :web_site_url => "http://www.amaroma.it/",
    :forwarder => @giulio_cesare
)

@anas_area_compartimentale_lazio = Agency.create(
    :name => "Anas Area Compartimentale Lazio",
    :note => "Donec eu aliquam quam. Curabitur sagittis vehicula nisl, dictum sodales odio vehicula a. Mauris a erat neque. Donec sagittis sapien sit amet justo vehicula, sed rutrum arcu aliquet.",
    :phone => "06722911",
    :email => "anas.lazio@gmail.com",
    :fax => "06722911",
    :street => "viale Bruno Rizzieri",
    :number => "142",
    :city => "Roma",
    :zip_code => "00167",
    :web_site_url => "http://www.stradeanas.it/it/area-compartimentale-lazio",
    :forwarder => @carlo_magno
)

@comune_di_roma_dipartimento_iii = Agency.create(
    :name => "Comune di Roma Dipartimento III",
    :note => "Proin quis dui id tortor suscipit hendrerit. Vestibulum leo libero, congue condimentum congue non, faucibus ut ante.",
    :phone => "066790962",
    :email => "comune.roma@gmail.com",
    :fax => "066790962",
    :street => "via Della Greca",
    :number => "5",
    :city => "Roma",
    :zip_code => "00167",
    :web_site_url => "https://www.comune.roma.it/web/it/home.page",
    :forwarder => @giovanni_giolitti
)

@comune_di_roma_servizio_giardini = Agency.create(
    :name => "Comune Di Roma Servizio Giardini",
    :note => "Donec vel dui at dolor feugiat sollicitudin at feugiat erat. Pellentesque et pellentesque est. Etiam consectetur diam et dictum rutrum. ",
    :phone => "066790962",
    :email => "comune.roma@gmail.com",
    :fax => "066790962",
    :street => "via Aurelia Antica",
    :number => "327",
    :city => "Roma",
    :zip_code => "00167",
    :web_site_url => "https://www.comune.roma.it/web/it/home.page",
    :forwarder => @oriana_fallaci
)

@autostrade_per_italia = Agency.create(
    :name => "Autostrade per l'Italia",
    :note => "Fusce lobortis, ex eu hendrerit vulputate, urna risus tincidunt nisi, ac blandit lacus eros sed ligula. Aenean ac nisi at neque vehicula pharetra.",
    :phone => "0644124461",
    :email => "autostrade.italia@gmail.com",
    :fax => "0644124461",
    :street => "via Mazzini",
    :number => "34",
    :city => "Roma",
    :zip_code => "00345",
    :web_site_url => "http://www.ramspa.it/",
    :forwarder => @rita_levi_montalcini
)

@roma_capitale = Agency.create(
    :name => "Roma Capitale",
    :note => "In volutpat finibus erat, vel viverra quam pretium sit amet. Sed eu libero eget velit malesuada elementum sit amet vel risus.",
    :phone => "06 0606",
    :email => "roma.capitale@gmail.com!",
    :fax => "06 0606",
    :street => "Piazza del Campidoglio",
    :number => "1",
    :city => "Roma",
    :zip_code => "00186",
    :web_site_url => "https://www.comune.roma.it/web/it/home.page" ,
    :forwarder => @maria_montessori
)
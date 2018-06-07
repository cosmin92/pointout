#language: it
Funzionalità: Registrazione di un utente segnalatore

  Contesto: Il cittadino intende creare un account con il ruolo di segnalatore
    Dato che sono nella pagina di creazione di un nuovo account segnalatore

  Scenario: Registrazione effettuata con successo
    Quando inserisco il nome "Mario" nel campo nome del form di registrazione come segnalatore
    E inserisco il cognome "Rossi" nel campo cognome del form di registrazione come segnalatore
    E inserisco il la mail "mario.rossi@gmail.com" nel campo email del form di registrazione come segnalatore
    E inserisco il numero di telefono "3396523492" nel campo telefono del form di registrazione come segnalatore
    E inserisco la password "passwordsicura" nel campo password del form di registrazione come segnalatore
    E inserisco la password "passwordsicura" nel campo password di conferma del form di registrazione come segnalatore
    E inserisco il nome della via di residenza "via Garibaldi" nel campo via del form di registrazione come segnalatore
    E inserisco il numero civico di residenza "105" nel campo numero civico del form di registrazione come segnalatore
    E inserisco il nome della città di residenza "Roma, RM" nel campo città del form di registrazione come segnalatore
    E inserisco il CAP della zona di residenza "00153" nel campo CAP del form di registrazione come segnalatore
    E inserisco il numero della carta di identità "AO1234567" nel campo numero del form di registrazione come segnalatore
    E inserisco il nome del comune di rilascio della carta di identità "Roma(RM)" nel campo comune del form di registrazione come segnalatore
    E inserisco la data di rilascio della carta di identità "17/03/2013" nel campo data di rilascio del form di registrazione come segnalatore
    E inserisco la data di scadenza della carta di identità "17/03/2018" nel campo data di scadenza del form di registrazione come segnalatore
    E invio clicco sul pulsante registra per inviare il form
    Allora devo vedere il nome "Mario"
    E devo vedere il cognome "Rossi"
    E devo vedere la mail "mario.rossi@gmail.com"
    E devo vedere il numero di telefono "3396523492"
    E devo vedere il nome della via di residenza "via Garibaldi"
    E devo vedere il numero civico di residenza "105"
    E devo vedere il nome della città di residenza "Roma, RM"
    E devo vedere il CAP della zona di residenza "00153"
    E devo vedere il numero della carta di identità "AO1234567"
    E devo vedere il nome del comune di rilascio della carta di identità "Roma(RM)"
    E devo vedere la data di scadenza della carta di identità "17/03/2018"
    Ma non devo vedere la password "passwordsicura"
    E devo vedere la data di rilascio della carta di identità "17/03/2013"


  Schema dello scenario: Registrazione fallita
    Quando inserisco il nome "<nome>" nel campo nome del form di registrazione come segnalatore
    E inserisco il cognome "<cognome>" nel campo cognome del form di registrazione come segnalatore
    E inserisco il la mail "<email>" nel campo email del form di registrazione come segnalatore
    E inserisco il numero di telefono "<telefono>" nel campo telefono del form di registrazione come segnalatore
    E inserisco la password "<password>" nel campo password del form di registrazione come segnalatore
    E inserisco la password "<password_di_conferma>" nel campo password di conferma del form di registrazione come segnalatore
    E inserisco il nome della via di residenza "<via_di_residenza>" nel campo via del form di registrazione come segnalatore
    E inserisco il numero civico di residenza "<numero_civico>" nel campo numero civico del form di registrazione come segnalatore
    E inserisco il nome della città di residenza "<citta_di_residenza>" nel campo città del form di registrazione come segnalatore
    E inserisco il CAP della zona di residenza "<CAP>" nel campo CAP del form di registrazione come segnalatore
    E inserisco il numero della carta di identità "<numero_carta>" nel campo numero del form di registrazione come segnalatore
    E inserisco il nome del comune di rilascio della carta di identità "<comune>" nel campo comune del form di registrazione come segnalatore
    E inserisco la data di rilascio della carta di identità "<data_rilascio>" nel campo data di rilascio del form di registrazione come segnalatore
    E inserisco la data di scadenza della carta di identità "<data_scadenza>" nel campo data di scadenza del form di registrazione come segnalatore
    E invio clicco sul pulsante registra per inviare il form
    Allora devo essere indirizzato di nuovo verso la pagina di registrazione di un segnalatore

    Esempi:
      | nome  | cognome | email                 | telefono   | password       | password_di_conferma | via_di_residenza | numero_civico | citta_di_residenza | CAP   | numero_carta | comune   | data_rilascio | data_scadenza |
      |       | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    | 105           | Roma, RM           | 00153 | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario |         | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    | 105           | Roma, RM           | 00153 | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   |                       | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    | 105           | Roma, RM           | 00153 | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com |            | passwordsicura | passwordsicura       | via Garibaldi    | 105           | Roma, RM           | 00153 | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 |                | passwordsicura       | via Garibaldi    | 105           | Roma, RM           | 00153 | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura |                      | via Garibaldi    | 105           | Roma, RM           | 00153 | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       |                  | 105           | Roma, RM           | 00153 | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    |               | Roma, RM           | 00153 | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    | 105           |                    | 00153 | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    | 105           | Roma, RM           |       | AO1234567    | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    | 105           | Roma, RM           | 00153 |              | Roma(RM) | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    | 105           | Roma, RM           | 00153 | AO1234567    |          | 17/03/2013    | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    | 105           | Roma, RM           | 00153 | AO1234567    | Roma(RM) |               | 17/03/2018    |
      | Mario | Rossi   | mario.rossi@gmail.com | 3396523492 | passwordsicura | passwordsicura       | via Garibaldi    | 105           | Roma, RM           | 00153 | AO1234567    | Roma(RM) | 17/03/2013    |               |

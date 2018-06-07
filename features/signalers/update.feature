#language: it
Funzionalità: Aggiorna account

  Contesto: Il cittadino ha un account, ha effettuato l"accesso ed è nella pagina di modifica dell"account
    Dato che mi sono precedentemente registrato e sono uno segnalatore con nome "Pinco", cognome "Pallino" email "p.pallino@gmail.com", password "passwordsicura" e telefono "1234567889"
    E sono residente in "via Domenico Tardini", numero "35", città "Roma(Rm)", CAP "00167"
    E la mia carta di identità con numero "AO1234567", rilasciata dal comune di "Roma" il "17/03/2013" scade il "17/03/2018"
    E ho effettuato lo accesso come segnalatore
    E sono nella pagina modifica del profilo segnalatore

  Schema dello scenario: Aggiornamento effettuato con successo
    Quando inserisco "<nome>" nel campo nome del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<cognome>" nel campo cognome del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<email>" nel campo email del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<telefono>" nel campo telefono del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<password>" sia nel campo nuova password sia nel campo passowrd di conferma del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<current_password>" nel campo password del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<via>" nel campo via di residenza del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<civico>" nel campo numero civico di residenza del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<citta>" nel campo città di residenza del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<CAP>" nel campo CAP della zona di residenza del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<numero>" nel campo numero carta di identità  del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<comune>" nel campo comune di rilascio della carta di identità  del form di aggiornamento del profilo di uno segnalatore
    E invio il form con i dati aggiornati
    Allora dovrei essere indirizzato alla pagina del mio profilo e vedere un messaggio che mi dica che la modifica è avvenuta con successo
    E dovrei vedere il mio profilo aggiornato

    Esempi:
      | nome  | cognome | email                 | telefono   | password      | current_password | via                  | civico | citta | CAP   | numero    | comune  |
      | Mario |         |                       |            |               | passwordsicura   |                      |        |       |       |           |         |
      |       | Rossi   |                       |            |               | passwordsicura   |                      |        |       |       |           |         |
      |       |         | mario.rossi@gmail.com |            |               | passwordsicura   |                      |        |       |       |           |         |
      |       |         |                       | 1234567890 |               | passwordsicura   |                      |        |       |       |           |         |
      |       |         |                       |            | nuovapassword | passwordsicura   |                      |        |       |       |           |         |
      |       |         |                       |            |               | passwordsicura   | via Domenico Tardini |        |       |       |           |         |
      |       |         |                       |            |               | passwordsicura   |                      | 35     |       |       |           |         |
      |       |         |                       |            |               | passwordsicura   |                      |        | Roma  |       |           |         |
      |       |         |                       |            |               | passwordsicura   |                      |        |       | 00156 |           |         |
      |       |         |                       |            |               | passwordsicura   |                      |        |       |       | AO0987651 |         |
      |       |         |                       |            |               | passwordsicura   |                      |        |       |       |           | Firenze |

  Scenario: Aggiornamento della data di scadenza e di rilascio con successo
    Quando inserisco "17/02/2018" e  "17/02/2024" rispettivamente nei campi data di scadenza e di rilascio del form di aggiornamento del profilo di uno segnalatore
    E inserisco "passwordsicura" nel campo password del form di aggiornamento del profilo di uno segnalatore
    E invio il form con i dati aggiornati
    Allora dovrei essere indirizzato alla pagina del mio profilo e vedere un messaggio che mi dica che la modifica è avvenuta con successo
    E dovrei vedere il mio profilo aggiornato

  Schema dello scenario: Aggioramento fallito
    Quando inserisco "<nome>" nel campo nome del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<cognome>" nel campo cognome del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<email>" nel campo email del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<telefono>" nel campo telefono del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<nuovapassword>" nel campo nuova password del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<confermapassword>" nel campo password di conferma del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<password>" nel campo password del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<citta>" nel campo città di residenza del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<CAP>" nel campo CAP della zona di residenza del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<numero>" nel campo numero carta di identità  del form di aggiornamento del profilo di uno segnalatore
    E inserisco "<comune>" nel campo comune di rilascio della carta di identità  del form di aggiornamento del profilo di uno segnalatore
    E invio il form con i dati aggiornati
    Allora la modifica non deve andare a buon fine e dovrei vedere la pagina di aggionamento

    Esempi:
      | nome  | cognome | email                 | telefono   | nuovapassword | confermapassword | password       | citta | CAP   | numero    | comune  |
      | Mario |         |                       |            |               |                  | passworderrata |       |       |           |         |
      |       | Rossi   |                       |            |               |                  | passworderrata |       |       |           |         |
      |       |         | mario.rossi3gmail.com |            |               |                  | passwordsicura |       |       |           |         |
      |       |         | mario.rossi@gmail.com |            |               |                  | passworderrata |       |       |           |         |
      |       |         |                       | 1234567890 |               |                  | passworderrata |       |       |           |         |
      |       |         |                       |            | 123           | 123              | passwordsicura |       |       |           |         |
      |       |         |                       |            | valida        | noncoincidente   | passwordsicura |       |       |           |         |
      |       |         |                       |            | valida        | valida           | passworderrata |       |       |           |         |
      |       |         |                       |            |               |                  | passworderrata | Roma  |       |           |         |
      |       |         |                       |            |               |                  | passworderrata |       | 00156 |           |         |
      |       |         |                       |            |               |                  | passworderrata |       |       | AO0987651 |         |
      |       |         |                       |            |               |                  | passworderrata |       |       |           | Firenze |


  Scenario: Il segnalatore cambia la data di rilascio della carta di identità e sbaglia password
    Quando inserisco "17/03/2013" e "17/03/2018" rispetivamente nel campo data di rilascio e data di scadenza della carta di di identità
    E inserisco una password "passworderrata" nel campo password del form di aggiornamento del profilo di uno segnalatore
    E invio il form con i dati aggiornati
    Allora la modifica non deve andare a buon fine e dovrei vedere la pagina di aggionamento
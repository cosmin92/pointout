#language: it
Funzionalità: Registrazione di un utente inoltratore

  Contesto: Il cittadino intende creare un account con il ruolo di inoltratore
    Dato che sono nella pagina di creazione di un nuovo account inoltratore
    E che esiste un gruppo di nome 'I fantastici', e con descrizione 'Ci occupiamo di servizi problemi ambientali'

  Scenario: Registrazione effettuata con successo(caso adesione ad un gruppo esistente)
    Quando inserisco il nome 'Mario' nel campo nome del form di registrazione come inoltratore
    E inserisco il cognome 'Rossi' nel campo cognome del form di registrazione come inoltratore
    E inserisco il mail 'mario.rossi@gmail.com' nel campo email del form di registrazione come inoltratore
    E inserisco la password 'passwordsicura' nel campo password del form di registrazione come inoltratore
    E inserisco la password 'passwordsicura' nel campo password di conferma del form di registrazione come inoltratore
    E scelgo di aderire al gruppo di nome 'I fantastici'
    E clicco sul pulsante registra per inviare il form
    Allora devo vedere un messaggio che mi dica che la registrazione è avvenuta con successo
    E devo vedere il nome 'Mario'
    E devo vedere il cognome 'Rossi'
    E devo vedere la mail 'mario.rossi@gmail.com'
    E devo essere un membro del gruppo scelto
    Ma non devo vedere la password 'passwordsicura'

  Scenario: Registrazione effettuata con successo(caso creazione nuovo gruppo)
    Quando inserisco il nome 'Mario' nel campo nome del form di registrazione come inoltratore
    E inserisco il cognome 'Rossi' nel campo cognome del form di registrazione come inoltratore
    E inserisco il mail 'mario.rossi@gmail.com' nel campo email del form di registrazione come inoltratore
    E inserisco la password 'passwordsicura' nel campo password del form di registrazione come inoltratore
    E inserisco la password 'passwordsicura' nel campo password di conferma del form di registrazione come inoltratore
    E scelgo di creare un mio gruppo di nome 'Los cittadinos' e descritto da 'Le nostre priorità sono le condizioni della strada.'
    E clicco sul pulsante registra per inviare il form
    Allora devo vedere un messaggio che mi dica che la registrazione è avvenuta con successo
    E devo vedere il nome 'Mario'
    E devo vedere il cognome 'Rossi'
    E devo vedere la mail 'mario.rossi@gmail.com'
    E devo vedere il nome del gruppo 'Los cittadinos' e la sua descrizione 'Le nostre priorità sono le condizioni della strada.'
    Ma non devo vedere la password 'passwordsicura'
    E devo essere un direttore

  Schema dello scenario: Registrazione fallita(caso adesione ad un gruppo esistente)
    Quando inserisco il nome '<nome>' nel campo nome del form di registrazione come inoltratore
    E inserisco il cognome '<cognome>' nel campo cognome del form di registrazione come inoltratore
    E inserisco il mail '<email>' nel campo email del form di registrazione come inoltratore
    E inserisco la password '<password>' nel campo password del form di registrazione come inoltratore
    E inserisco la password '<password_di_conferma>' nel campo password di conferma del form di registrazione come inoltratore
    E seleziono il gruppo '<gruppo>' dalla lista
    E clicco sul pulsante registra per inviare il form
    Allora la registrazione deve fallire e devo essere informato sulla causa del fallimento
    E devo essere indirizzato di nuovo verso la pagina di registrazione di un inoltratore

    Esempi:
      | nome  | cognome | email                 | password       | password_di_conferma | gruppo       |
      |       | Rossi   | mario.rossi@gmail.com | passwordsicura | passwordsicura       | I fantastici |
      | Mario |         | mario.rossi@gmail.com | passwordsicura | passwordsicura       | I fantastici |
      | Mario | Rossi   | mario.rossi@gmail.com | passwordsicura | passwordsicura       |              |
      | Mario | Rossi   |                       | passwordsicura | passwordsicura       | I fantastici |
      | Mario | Rossi   | mario.rossi@gmail.com |                | passwordsicura       | I fantastici |
      | Mario | Rossi   | mario.rossi@gmail.com | passwordsicura |                      | I fantastici |


  Schema dello scenario: Registrazione fallita(caso creazione nuovo gruppo)
    Quando inserisco il nome '<nome>' nel campo nome del form di registrazione come inoltratore
    E inserisco il cognome '<cognome>' nel campo cognome del form di registrazione come inoltratore
    E inserisco il mail '<email>' nel campo email del form di registrazione come inoltratore
    E inserisco la password '<password>' nel campo password del form di registrazione come inoltratore
    E inserisco la password '<password_di_conferma>' nel campo password di conferma del form di registrazione come inoltratore
    E scelgo di creare un nuovo gruppo
    E inserisco '<nome_gruppo>' nel campo nome gruppo del form di registrazione come inoltratore
    E inserisco '<descrizione>' nel campo descrizione gruppo del form di registrazione come inoltratore
    E clicco sul pulsante registra per inviare il form
    Allora la registrazione deve fallire e devo essere informato sulla causa del fallimento
    E devo essere indirizzato di nuovo verso la pagina di registrazione di un inoltratore

    Esempi:
      | nome | cognome | email | password | password_di_conferma | nome_grupp |
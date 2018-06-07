# language: it
Funzionalità: Accesso al sistema nella modalità standard

  Contesto: Il cittadino, precedentemente registrato, itende effettuare l"accesso al sistema in ruolo di segnalatore
    Dato che mi sono registrato come signalatore con "Mario", "Rossi","mario.rossi@gmail.com", "3396523492", "passwordsicura", "via Garibaldi", "105", "Roma, RM", "00153", "AO1234567", "Roma(RM)", "17/03/2013", "17/03/2018"
    E non ho una sessione aperta
    E sono nella pagina di accesso per un segnalatore

  Scenario: Accesso effettuato con successo
    Quando inserisco "mario.rossi@gmail.com" nel campo email del form di accesso come segnalatore
    E inserisco "passwordsicura" nel campo password del form di accesso come segnalatore
    E clicco sul pulsante accedi per inviare il form
    Allora devo essere indirizzato verso la pagina home

  Schema dello scenario: Accesso fallito
    Quando inserisco "<email>" nel campo email del form di accesso come segnalatore
    E inserisco "<password>" nel campo password del form di accesso come segnalatore
    E clicco sul pulsante accedi per inviare il form
    Allora mi deve essere negato lo accesso e devo vedere un messaggio di errore sul relativo campo invalido

    Esempi:
      | email                       | password       |
      |                             | passwordsicura |
      | email.non.valida.com        | passwordsicura |
      | emails.conosciuta@gmail.com | passwordsicura |
      | mario.rossi@gmail.com       |                |
      | mario.rossi@gmail.com       | passworderrata |
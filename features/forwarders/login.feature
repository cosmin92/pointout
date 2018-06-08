# language: it
Funzionalità: Accesso al sistema nella modalità standard Forwarder

  Contesto: Il cittadino, precedentemente registrato, itende effettuare l"accesso al sistema in ruolo di addetto allo inoltro
    Dato che mi sono registrato come addetto allo inoltro con "Mario", "Rossi","mario.rossi@gmail.com" e "passwordsicura"
    E non ho una sessione aperta da addetto allo inoltro
    E sono nella pagina di accesso per un addetto allo inoltro

  Scenario: Accesso effettuato con successo
    Quando inserisco "mario.rossi@gmail.com" nel campo email del form di accesso come addetto allo inoltro
    E inserisco "passwordsicura" nel campo password del form di accesso come addetto allo inoltro
    E clicco sul pulsante accedi per inviare il form
    Allora devo essere indirizzato verso la pagina root

  Schema dello scenario: Accesso fallito
    Quando inserisco "<email>" nel campo email del form di accesso come addetto allo inoltro
    E inserisco "<password>" nel campo password del form di accesso come addetto allo inoltro
    E clicco sul pulsante accedi per inviare il form
    Allora mi deve essere negato lo accesso e devo vedere un messaggio di errore sul relativo campo invalido del addetto allo inoltro

    Esempi:
      | email                       | password       |
      |                             | passwordsicura |
      | email.non.valida.com        | passwordsicura |
      | email                       | passwordsicura |
      | emails.conosciuta@gmail.com | passwordsicura |
      | mario.rossi@gmail.com       |                |
      | mario.rossi@gmail.com       | passworderrata |
#language: it
Funzionalità: Invia Segnalazione

  Contesto: Il cittadino ha un account, ha effettuato l"accesso ed è nella pagina di modifica dell"account
    Dato che mi sono precedentemente registrato e sono uno segnalatore con nome "Pinco", cognome "Pallino" email "p.pallino@gmail.com", password "passwordsicura" e telefono "1234567889"
    E sono residente in "via Domenico Tardini", numero "35", città "Roma(Rm)", CAP "00167"
    E la mia carta di identità con numero "AO1234567", rilasciata dal comune di "Roma" il "17/03/2013" scade il "17/03/2018"
    E ho effettuato lo accesso come segnalatore
    E dato che esite una tipologia di problemi di nome "Randagismo"
    E sono nella pagina di creazione di una nuova segnalazione


  Scenario: Segnalazione inviata con successo
    Quando inserisco "Oggetto" nel campo oggetto del form di creazione di un nuovo report
    E inserisco "descrizione" nel campo descrizione del form di creazione di un nuovo report
    E inserisco "tag1, tag2,tag3" nel campo tags del form di creazione di un nuovo report
    E inserisco "Via Gregorio VII, Rome, Metropolitan City of Rome, Italy" nel campo indirizzo del form di creazione di un nuovo report
    E scelgo il tipo di segnalazioe reclamo dal form di creazione di un nuovo report
    E scelgo il tipo di intervento correttivo dal form di creazione di un nuovo report
    E indico che si deve intrvenire immediatamente sul sulla problematica
    E scelgo la tipologia "Randagismo" nel campo tipologia del form di creazione di un nuovo report
    E invio il modulo di creazione di un nuova segnalazione
    Allora dovrei essere indirizzato nella pagina di visualizzazione del report appena inviato
    E dovrei almeno vedere l'oggetto "Oggetto"
    E dovrei vedere la descrizione "descrizione"

  Schema dello scenario: Segnalazione non valida
    Quando inserisco "<oggetto>" nel campo oggetto del form di creazione di un nuovo report
    E inserisco "<descrizione>" nel campo descrizione del form di creazione di un nuovo report
    E inserisco "<indirizzo>" nel campo indirizzo del form di creazione di un nuovo report
    E scelgo la tipologia "<tipologia>" nel campo tipologia del form di creazione di un nuovo report
    Allora lo invio non deve andare a buon fine e dovrei vedere di nuovo la pagina di creazione di una segnalazione

    Esempi:
      | oggetto | descrizione | indirizzo                                                | tipologia  |
      |         | descrizione | Via Gregorio VII, Rome, Metropolitan City of Rome, Italy | Randagismo |
      | oggetto |             | Via Gregorio VII, Rome, Metropolitan City of Rome, Italy | Randagismo |
      | oggetto | descrizione |                                                          | Randagismo |
      | oggetto | descrizione | Via Gregorio VII, Rome, Metropolitan City of Rome, Italy |            |

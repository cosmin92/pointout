#language: it
Funzionalità: Invia Segnalazione

  Contesto: Il cittadino ha un account, ha effettuato l"accesso ed è nella pagina di modifica dell"account
    Dato che mi sono precedentemente registrato e sono uno segnalatore con nome "Pinco", cognome "Pallino" email "p.pallino@gmail.com", password "passwordsicura" e telefono "1234567889"
    E sono residente in "via Domenico Tardini", numero "35", città "Roma(Rm)", CAP "00167"
    E la mia carta di identità con numero "AO1234567", rilasciata dal comune di "Roma" il "17/03/2013" scade il "17/03/2018"
    E ho effettuato lo accesso come segnalatore
    E dato che esite una tipologia di problemi di nome "Randagismo"
    E che esiste una segnalazione nel sistema
    E sono nella pagina di visualizazione dei questa segnalazione

  Scenario: Invio osservazione con successo
    Quando inserisco "osservazione" nel campo contenuto del form di creazione di una nuova osservazione
    E inserisco "tag1,tag2" nel campo tags del form di creazione di una nuova osservazione
    E invio il form di creazione di una nuova osservazione
    Allora devo esse indirizzato versa la paggina di registrazione della stessa segnalazione
    E devo vedere la osservazione appena creata con contenuto "osservazione"

  Scenario: Utente non autenticato
    Quando non sono auteticato come segnalatore
    E inserisco "osservazione" nel campo contenuto del form di creazione di una nuova osservazione
    E inserisco "tag1,tag2" nel campo tags del form di creazione di una nuova osservazione
    E invio il form di creazione di una nuova osservazione
    Allora devo essere iondirizzato verso la pagina di autenticazione di un nuovo segnalatore
    E se effettuato lo asccesso e vado nella pagina di visualizazione della stessa segnalazione
    E se inserisco la "osservazione" nel campo contenuto del form di creazione di una nuova osservazione
    E se inserisco "tag1,tag2" nel campo tags del form di creazione di una nuova osservazione
    E reinvio il form di creazione di una nuova osservazione
    Allora devo esse indirizzato versa la paggina di registrazione della stessa segnalazione
    E devo vedere la osservazione appena creata con contenuto "osservazione"



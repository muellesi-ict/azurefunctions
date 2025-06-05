# Labor: Azure Functions (FaaS)

## Lernziele dieses Labors

- Beschreiben, was FaaS ist und wofür es eingesetzt wird.
- Den Ablauf der lokalen Installation erklären, um Functions auf dem Gerät schreiben und ausführen zu können.
- Eine eigene funktionierende Function erstellen, die alle Daten aus einer Datenbank ausliest.

## Umgebungsaufbau

In diesem Labor wird eine Function erstellt und lokal getestet. Anschließend wird diese mittels GitHub auf Azure deployt und eine Verbindung zu einer Cosmos-Datenbank hergestellt.

## Vorarbeiten

1. **Github Account anmelden und Browser offen lassen**
2. **Azure Account anmelden und Browser offen lassen**
3. **Visual Studio Code öffnen**

## Einrichten von Visual Studio Code

1. **Azure Tools installieren:**

   Suche in Extensions nach "Azure Tools" und installieren.

   ```plaintext
   Suche in Extensions nach "Azure Tools" und installieren.
   ```

2. **Ordner öffnen:**

   Öffnen Sie unter Explorer einen Ordner. Sie können einen beliebigen Ordner erstellen oder wählen.

3. **Anmelden bei Azure:**

   Klicken Sie auf "Sign in to Azure" und wählen Sie Ihren Account.

   ```plaintext
   Klicken Sie auf "Sign in to Azure" und wählen Sie Ihren Account.
   ```

## Lokale Function erstellen

1. **Function erstellen:**

   Klicken Sie auf "Create Functions" und wählen Sie einen Ordner.

   ```plaintext
   Klicken Sie auf "Create Functions" und wählen Sie einen Ordner.
   ```

2. **Abfragen bestätigen:**

   Wählen Sie JavaScript als Sprache, HTTP Trigger als Template und setzen Sie einen Namen.

   ```plaintext
   Wählen Sie JavaScript als Sprache, HTTP Trigger als Template und setzen Sie einen Namen.
   ```

3. **Function lokal ausführen:**

   Drücken Sie F5 und wählen Sie "Connect Storage Account".

   ```plaintext
   Drücken Sie F5 und wählen Sie "Connect Storage Account".
   ```

## Deployment auf Azure

1. **Git konfigurieren:**

   ```bash
   git config --global user.name "VORNAME NACHNAME"
   git config --global user.email MAIL
   ```

2. **Code commiten:**

   Commiten Sie den Code in Visual Studio Code und wählen Sie ein privates Repository.

   ```plaintext
   Commiten Sie den Code in Visual Studio Code und wählen Sie ein privates Repository.
   ```

3. **Function App erstellen:**

   Klicken Sie auf "Function App" und erstellen Sie eine neue Function App mit den angegebenen Infos.

   ```plaintext
   Klicken Sie auf "Function App" und erstellen Sie eine neue Function App mit den angegebenen Infos.
   ```

4. **Deployment Source konfigurieren:**

   Wählen Sie "Configure Deployment Source" und konfigurieren Sie GitHub als Quelle.

   ```plaintext
   Wählen Sie "Configure Deployment Source" und konfigurieren Sie GitHub als Quelle.
   ```

5. **Code ändern und commiten:**

   Machen Sie eine kleine Änderung im Code und commiten Sie diese.

   ```plaintext
   Machen Sie eine kleine Änderung im Code und commiten Sie diese.
   ```

## Umgebungsvariable hinterlegen

1. **Umgebungsvariable hinterlegen:**

   ```plaintext
   Name: CosmosDB
   Inhalt: AccountEndpoint=https://db-cosmos-prod-7a1dac5d.documents.azure.com:443/;AccountKey=KCFSwii8cpISoF2hWpOy02226gy0WnmSv1wqHYpzrx2rjKulMcH2s37whuVFlCmMJg5skQsL6gruACDb0IWGkA==;
   ```

2. **Remote Settings herunterladen:**

   Drücken Sie CTRL+Shift+P und wählen Sie "Azure Function: Download Remote Settings".

   ```plaintext
   Drücken Sie CTRL+Shift+P und wählen Sie "Azure Function: Download Remote Settings".
   ```

## Anpassen der Function

1. **Code anpassen:**

   ```javascript
   const { app, input } = require('@azure/functions');

   const cosmosInput = input.cosmosDB({
       databaseName: 'DemoDatabase',
       containerName: 'Items',
       connection: 'CosmosDB',
       sqlQuery: "select * from c"
   });

   app.http('getItems', {
       methods: ['GET'],
       authLevel: 'anonymous',
       extraInputs: [cosmosInput],
       route: 'items',
       handler: async (request, context) => {
           const items = context.extraInputs.get(cosmosInput);
           return {
               body: JSON.stringify(items),
               status: 200
           };
       }
   });
   ```

2. **Lokal ausführen und testen:**

   Führen Sie die Function lokal aus und testen Sie die URL.

   ```plaintext
   Führen Sie die Function lokal aus und testen Sie die URL.
   ```

3. **Code auf GitHub pushen:**

   Pushen Sie den Code auf GitHub und überprüfen Sie die Funktion in Azure.

   ```plaintext
   Pushen Sie den Code auf GitHub und überprüfen Sie die Funktion in Azure.
   ```

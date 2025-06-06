# KW 
## Ziele 
- [ ] nach jeder präsi 5 minuten exploratory writing im journal machen
- [ ] altbewährte praktik von pomodorotimer zurückholen für aufträge
- [ ] trello jede stunde aktualisieren
- [ ] 

## Learnings

### Was ist das CIA-Prinzip?**
Geheimniskrämerei - wie beim Geheimdienst. Ein guter Ausgangspunkt für die Anektote. Ein Senior Developer würde sicherstellen, dass alle Daten verschlüsselt sind. Immer, sowohl bei der Übertragung als im Ruhezustand *(Confidentiality = Vertraulichkeit)*. Er würde Backups und Integritätsprüfungen durchführen, um zu verhindern, dass Daten verändert werden *(Integrity = Integrität)*. Er würde Systeme redundant einrichten, um die Verfügbarkeitzu gewährleisten *(Availability = Verfügbarkeit)*.

Nun gut, aber warum muss ich das im Cloud Modul wissen? In der Cloud sind diese drei Prinzipien genauso relevant. Cloud heisst ja nur, dass ich das Computing auslagere. Ich muss die CloudInfrastruktur schützen mit (MFA) und Firewalls. Ich muss meine Hochverfügbarkeit regeln, Redundanzen nutzen die mir Azure anbietet.

### Wozu dienen die Tags in Azure?
Vor allem für das Monitoring meiner Ressourcen. Wie auf Zalando, gibt es Filter, die ich anwenden kann. Wenn ich ein Bestatter bin, filtere ich nach "schwarz", "langarm", "Baumwolle" und noch eine Grössenangabe. Aber die Filter funktionieren nur, weil die einzelneln Kleidungsstücke (In Azure die Ressourcen) mit Tags versetzt werden. Jeder Wert der ein Filter auslesen kann ist ein Tag. Zum beispiel "Tag:Wert" ist dann "Farbe:Schwarz". Auch in Skripten für die Automatisierung können Tags sich nützlich erweisen.

### (IaaS, PaaS oder SaaS)
Stichwort "Arbeitsteilung" und Verantwortlichkeiten abschieben. SaaS Nutzer lassen sich ihr SChnitzel im Restaurant vom Kellner in Stücke schneiden und füttern. Hey, wir sind alle im gleichen Boot. Es gibt kein Smartphonebesitzer der nicht SaaS Nutzer ist. Und das ist okay. SaaS ist die Möglichkeit jemandem ein Softwareprodukt zur Verfügungzustellen, das funktioiert und als Werkzeug dient. Niemand will sein digitales Leben selbst coden. Sonst müsstest du zuerst dein Testament und dein Bestattungsplan schreiben und auf Git pushen.

**Paas** gibt mir mehr Entscheidungsfreiheit bezüglich Runtime. Ich sage aber nicht welche Version der Runtime benutzt wird. Ich gebe Azure den Code und gehe in die Ferien. Ähnlich das neue Buzzword **FaaS** Function as a Service. Kleine Codesnippets, die ich gratis ausführen kann, weil sie der CPU ein müdes Lächeln abzwingen und kaum Ressourcen brauchen. Zum Beispiel GitHub Actions und Azure Functions.
**IaaS** Ist für die Schwitzer und Frühpensionierten, die Legacy Software laufen lassen wollen. Ist böse und trifft dem Hamster auf die Backe. Zumal bezüglich Runtime Environment. Denn nur special Usecases nuzen IaaS als RUntime Option. Eine VM hingegen ist eine legitime Form von IaaS. In der Informatik komme ich nicht ohne VMs aus. Die Argumentation dafür ist in meinem Legacy-Journal "Virtualisierung".

- **Update Domains**: Ein Senior Developer würde sicherstellen, dass VMs auf verschiedene Update Domains verteilt sind, sodass bei einem Update nicht alle VMs gleichzeitig neu gestartet werden müssen.
- **Fault Domains**: Er würde VMs auf verschiedene Fault Domains verteilen, um das Risiko eines gleichzeitigen Ausfalls zu minimieren.
- **Zones**: Durch die Verteilung der VMs auf mehrere Availability Zones würde er sicherstellen, dass ein Ausfall in einer Zone nicht die gesamte Anwendung betrifft.
- **Regions**: Er würde kritische Anwendungen in mehreren Regionen bereitstellen, um bei einem regionalen Ausfall die Verfügbarkeit zu gewährleisten.

**Wie viele VMs würden bei dem folgenden Szenario mit einer optimalen Aufteilung ausfallen?**

- **Regionsausfall**: Ein Senior Developer würde sicherstellen, dass bei einem Ausfall einer Region nur die Hälfte der VMs betroffen ist, indem er die VMs gleichmäßig auf zwei Regionen verteilt.
- **Zone 1 in Region 1**: Bei einem Ausfall von Zone 1 in Region 1 würden nur die VMs in dieser Zone betroffen sein, was bei einer gleichmäßigen Verteilung etwa 2-3 VMs entspricht.
- **Update Domain 1 hat Fehler**: Bei einem Fehler in Update Domain 1 würden nur die VMs in dieser Domain betroffen sein, was bei einer gleichmäßigen Verteilung etwa 1-2 VMs entspricht.
- **Eine Fault Domain in Zone 1 der Region 2 fällt aus**: Bei einem Ausfall einer Fault Domain in Zone 1 der Region 2 würde nur eine VM betroffen sein, wenn die VMs gleichmäßig auf die Fault Domains verteilt sind.

- **Umsetzung in der Praxis**: Ein Senior Developer würde eine Architektur für die IstSo GmbH entwerfen, die den App Service für die Webanwendung, Azure Functions für das Backend und Blob Storage sowie Azure Database for MySQL für die Datenablage nutzt. Er würde sicherstellen, dass alle Komponenten redundant und skalierbar sind, und würde die Architektur in Draw.io dokumentieren, um sie mit dem Team zu teilen und zu besprechen. Er würde auch sicherstellen, dass die Architektur den Sicherheits- und Compliance-Anforderungen entspricht.

Diese Ansätze helfen einem Senior Developer, robuste, sichere und effiziente Lösungen zu entwickeln, die den Anforderungen der Benutzer und des Unternehmens gerecht werden.

## Terraform Nice to Know
Wenn Sie versuchen, eine Ressourcengruppe in Azure zu löschen, die noch Ressourcen enthält, wie z.B. ein virtuelles Netzwerk (VNet), wird Azure normalerweise verhindern, dass die Ressourcengruppe gelöscht wird, um unbeabsichtigtes Löschen von Ressourcen zu vermeiden. Dies ist eine Sicherheitsmaßnahme, um sicherzustellen, dass keine wichtigen Ressourcen versehentlich gelöscht werden.

Allerdings gibt es eine Ausnahme, wenn Sie die Ressourcengruppe über die Azure-API löschen. Wenn Sie die Ressourcengruppe über die Azure-API löschen, wird Azure die Ressourcengruppe und alle darin enthaltenen Ressourcen löschen, sofern keine Abhängigkeiten außerhalb der Ressourcengruppe bestehen. Das bedeutet, dass alle Ressourcen innerhalb der Ressourcengruppe, einschließlich VNets, gelöscht werden.

Es ist wichtig zu beachten, dass dies ein irreversibler Vorgang ist und alle Ressourcen in der Ressourcengruppe unwiderruflich gelöscht werden. Stellen Sie sicher, dass Sie keine wichtigen Ressourcen oder Daten verlieren, die nicht wiederhergestellt werden können.

Wenn Sie die Option prevent_deletion_if_contains_resources = false in Terraform verwenden, wird Terraform versuchen, die Ressourcengruppe über die Azure-API zu löschen, ohne vorher zu überprüfen, ob sie Ressourcen enthält. Dies kann dazu führen, dass die Ressourcengruppe und alle darin enthaltenen Ressourcen gelöscht werden, sofern keine externen Abhängigkeiten bestehen.

```
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
```

### Löschen von Ressourcen
Wenn Sie eine Ressource aus Ihrer main.tf-Datei entfernen und dann terraform apply ausführen, wird Terraform erkennen, dass diese Ressource nicht mehr in Ihrer Konfiguration definiert ist. Terraform wird dann versuchen, diese Ressource in Ihrer Infrastruktur zu zerstören, um den Zustand Ihrer Infrastruktur mit der Konfiguration in Ihrer main.tf-Datei abzugleichen.
 
## Azure Terraform Setup

Repository Tree pflanzen nach best practice. so könnte das aussehen.

```
project-root/
│
├── .github/
│   └── workflows/
│       ├── azure-functions-deploy.yml
│       └── azure-webapp-deploy.yml
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/
│
├── src/
│   ├── functions/
│   │   ├── function1/
│   │   └── function2/
│   │
│   └── webapp/
│
├── .gitignore
├── README.md
└── ...
```

## Beispiel von Ergonomischen Files
Ergonomisch arbeiten heisst, mit allen Fingern, Zehen und Bandscheiben in den Feierabend zu schlendern - im Handwerk. Aber auch, dass ich mein Werkstück fixieren kann und meine Fähigkeiten in Einklang stelle mit den Werkzeugen die ich zur Verfügung habe. Ich kann nicht eine Linie schneiden, wenn mein Werkstück herumflattert wie ein Speckt der sich im Volleyballnetz verfangen hat. Genauso in der IT. 
Ich will nicht unnötig viel klicken, schreiben und Fenster switchen. Das vergeudet Zeit und Konzentration. EIn gutes Setup erleichtert mir die Arbeit und hilft mir Qualität zu liefern. Zum beispiel baue ich alles was ich schreiben muss in einen Codeblock. Namen von Optionen, Ressourcen, FIltern - das, was ich eintippen müsste in ein Inputfeld und Codesnipets. Damit schreibe ich ein 12 Zeichen langen Namen nciht 5 Mal unterschiedlich. Beispiel, kommt sofort.

**Terraform Installation kontrollieren**

```bash
terraform --version
```

**Azure CLI Installation kontrollieren**

```bash
az --version
```

**Melden dich beim Azure-Konto an und wählen die Subscription aus**

```bash
az login
```

```
az account set --subscription="<subscription-id>"
```

Und dank Markdown-Rendering wird daraus ein Clipboard-Block. Danke GitHub, Microsoft und Hasicorp, dass ihr ein Standard setzt. Manchmal darf sich das Leben wie ein Tutorial anfühlen. Macht meinen Arbeitsalltag so flüssig wie der Pinot-Rosé im Gaumen.

## First Principles, Hacks und Best Practices für Terraform CI/CD

### Umgang mit Umgebungsvariablen in GitHub Actions

GitHub Actions kennt keine Umgebungsvariablen für bestimmte Befehle wie `npm install`. Eine kreative Lösung besteht darin, die Umgebungsvariablen direkt in den Skripten zu setzen oder ein separates Skript zu verwenden, um die Variablen zu laden.

### Build-Prozess in Azure

Durch die Nutzung von Azure Pipelines oder Azure DevOps für den Build-Prozess können Umgebungsvariablen effektiv genutzt werden. Diese Tools sind darauf ausgelegt, mit den spezifischen Anforderungen von Azure zu arbeiten und bieten eine nahtlose Integration.

## Best Practices für Senior Entwickler

### Terraform State Management

Die Verwendung von Remote Backends wie Azure Blob Storage zum Speichern des Terraform States ermöglicht die Zusammenarbeit im Team und schützt vor Datenverlust. Dies stellt sicher, dass der Zustand der Infrastruktur immer aktuell und sicher ist.

### Geheimnisverwaltung

Tools wie Azure Key Vault sollten verwendet werden, um Geheimnisse sicher zu speichern und zu verwalten. Die Integration dieser Tools in die CI/CD-Pipeline stellt sicher, dass sensible Informationen geschützt sind.

### Pipeline-Sicherheit

Die Sicherheit der CI/CD-Pipeline ist von entscheidender Bedeutung. Dies umfasst die Implementierung von Zugriffsbeschränkungen und die sichere Verwaltung von Geheimnissen.

### Monitoring und Logging

Die Integration von Monitoring und Logging in die Infrastruktur hilft, Probleme frühzeitig zu erkennen und zu beheben. Tools wie Azure Monitor und Application Insights bieten umfassende Möglichkeiten zur Überwachung und Protokollierung.

### Dokumentation

Eine gründliche Dokumentation des Terraform-Codes und der CI/CD-Pipeline erleichtert das Onboarding neuer Teammitglieder und die Wartung des Codes. Dies sollte Best Practices, Architekturentscheidungen und Anleitungen zur Fehlerbehebung umfassen.

## Spezifische Lösungen für dein Szenario

### Umgebungsvariablen in GitHub Actions

Durch das Setzen von Umgebungsvariablen in GitHub Actions Workflows können Skripte die benötigten Variablen nutzen. Dies ist besonders wichtig für Befehle, die diese Variablen benötigen, wie `npm install`.

### Build-Prozess in Azure

Azure Pipelines bieten eine robuste Lösung für den Build-Prozess, da sie die Umgebungsvariablen kennen und entsprechend nutzen können. Dies stellt sicher, dass der Build-Prozess reibungslos abläuft.

### Terraform für Infrastruktur

Terraform sollte verwendet werden, um die Azure-Funktion und Cosmos DB zu erstellen und zu verwalten. Durch die Speicherung des Terraform States in einem Remote Backend wie Azure Blob Storage wird die Konsistenz und Sicherheit der Infrastruktur gewährleistet.

### Geheimnisverwaltung

Azure Key Vault bietet eine sichere Lösung zur Verwaltung von Geheimnissen. Die Integration in die Terraform-Konfiguration und die CI/CD-Pipeline stellt sicher, dass sensible Informationen geschützt sind.

### Monitoring und Logging

Die Integration von Monitoring und Logging in die Infrastruktur hilft, Probleme frühzeitig zu erkennen und zu beheben. Dies ist entscheidend für die Aufrechterhaltung der Betriebskontinuität und die schnelle Reaktion auf Vorfälle.

## CI/CD Pipeline

### Nutzung der CI/CD Pipeline

Eine CI/CD Pipeline automatisiert den Prozess des Testens, Bauens und Bereitstellens von Software. Dies stellt sicher, dass Änderungen schnell und sicher in die Produktion übernommen werden können.

### Terraform Repository

Ein Terraform Repository enthält die Definitionen der Infrastruktur als Code. Durch das Pushen dieser Dateien zu GitHub wird eine Historie der Änderungen erstellt, die die Zusammenarbeit und Wartung erleichtert.

### Probleme mit Secrets und Terraform State

Secrets und der Terraform State sollten nicht in das Git-Repository gepusht werden, da sie sensible Informationen enthalten. Die Verwendung von `.gitignore` stellt sicher, dass diese Dateien nicht versehentlich in das Repository aufgenommen werden.

### Versionen von Runtimes und Einstellungen

Die Verwendung von Variablen zur Speicherung von Versionen und Einstellungen erleichtert die Wartung und Anpassung des Codes. Dies stellt sicher, dass Änderungen zentral verwaltet werden können.

### versions.tf Datei

Die `versions.tf` Datei definiert die Versionen der Provider, die Terraform verwendet. Dies stellt sicher, dass alle Teammitglieder mit den gleichen Versionen arbeiten und Konsistenz gewährleistet ist.

### Warum ein Senior Dev Versionen einsetzt

Ein erfahrener Entwickler verwendet Versionen, um Konsistenz und Stabilität zu gewährleisten. Durch die Festlegung von Versionen werden unerwartete Änderungen vermieden und die Wartung des Projekts erleichtert.

## Schlussfolgerung

Dieses Lernjournal bietet einen umfassenden Überblick über wichtige First Principles, Hacks und Best Practices für Terraform und CI/CD. Durch die Anwendung dieser Prinzipien und Praktiken können Plattform-Ingenieure und Senior-Entwickler ihre Infrastruktur sicher und effizient verwalten. Wenn du spezifische Fragen hast oder weitere Details benötigst, lass es mich wissen!
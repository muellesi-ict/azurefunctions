# KW 
## Ziele 
- [ ] nach jeder präsi 5 minuten exploratory writing im journal machen
- [ ] altbewährte praktik von pomodorotimer zurückholen für aufträge
- [ ] trello jede stunde aktualisieren
- [ ] 

### Theorie Fragen

**Was ist das CIA-Prinzip?**
Geheimniskrämerei - wie beim Geheimdienst. Ein guter Ausgangspunkt für die Anektote. Ein Senior Developer würde sicherstellen, dass alle Daten verschlüsselt sind. Immer, sowohl bei der Übertragung als im Ruhezustand *(Confidentiality = Vertraulichkeit)*. Er würde Backups und Integritätsprüfungen durchführen, um zu verhindern, dass Daten verändert werden *(Integrity = Integrität)*. Er würde Systeme redundant einrichten, um die Verfügbarkeitzu gewährleisten *(Availability = Verfügbarkeit)*.

1. **Wieso ist dies in der Cloud ebenfalls sehr wichtig?**
   - **Umsetzung in der Praxis**: In der Cloud würde ein Senior Developer zusätzliche Sicherheitsmaßnahmen wie Multi-Faktor-Authentifizierung (MFA) und Netzwerksicherheitsgruppen einrichten. Er würde auch sicherstellen, dass alle Daten in verschiedenen geografischen Regionen repliziert werden, um die Verfügbarkeit zu erhöhen und die Datenintegrität durch regelmäßige Snapshots zu sichern.

2. **Wozu dienen die Tags in Azure?**
   - **Umsetzung in der Praxis**: Ein Senior Developer würde Tags verwenden, um Ressourcen nach Projekten, Abteilungen oder Umgebungen (z.B. Entwicklung, Test, Produktion) zu kategorisieren. Dies erleichtert die Kostenverfolgung und das Management von Ressourcen. Er könnte auch Automatisierungsskripte schreiben, die auf Basis dieser Tags Ressourcen verwalten.

3. **Kann man sagen, welches Betriebskonzept (IaaS, PaaS oder SaaS) man 
4. benutzen soll?**
   - **Umsetzung in der Praxis**: Ein Senior Developer würde eine Bedarfsanalyse durchführen, um das passende Betriebskonzept zu wählen. Für ein Projekt mit spezifischen Infrastruktur-Anforderungen könnte er IaaS wählen, um volle Kontrolle zu haben. Für ein Entwicklerteam, das sich auf die Anwendungsentwicklung konzentrieren möchte, wäre PaaS die bessere Wahl. Für Standardanwendungen wie E-Mail oder CRM-Systeme würde er SaaS-Lösungen bevorzugen, um Wartungsaufwand zu minimieren.

5. **Beschreibe den Aufbau einer Azure Region in deinen eigenen Worten.**
   - **Umsetzung in der Praxis**: Ein Senior Developer würde den Aufbau einer Azure Region nutzen, um hochverfügbare und ausfallsichere Anwendungen zu entwerfen. Er würde sicherstellen, dass Anwendungen in mehreren Availability Zones bereitgestellt werden, um die Ausfallsicherheit zu erhöhen. Zudem würde er die geografische Verteilung von Regionen nutzen, um Latenzzeiten zu minimieren und die Compliance mit lokalen Datenschutzbestimmungen sicherzustellen.

### Architektur

1. **Nenne 2 Informationsquellen, bei welchen man mehr Informationen zu Architekturen oder deren Dienste bekommen kann.**
   - **Umsetzung in der Praxis**: Ein Senior Developer würde regelmäßig die Microsoft Docs und das Azure Architecture Center konsultieren, um sich über Best Practices und neue Dienste zu informieren. Er würde diese Ressourcen nutzen, um Architekturentscheidungen zu validieren und sicherzustellen, dass die gewählten Dienste den Anforderungen entsprechen.

### Verfügbarkeit

**Wie teilt man 10 VMs entsprechend aus, um eine möglichst gute Verfügbarkeit nach Best Practice zu erhalten?**

- **Update Domains**: Ein Senior Developer würde sicherstellen, dass VMs auf verschiedene Update Domains verteilt sind, sodass bei einem Update nicht alle VMs gleichzeitig neu gestartet werden müssen.
- **Fault Domains**: Er würde VMs auf verschiedene Fault Domains verteilen, um das Risiko eines gleichzeitigen Ausfalls zu minimieren.
- **Zones**: Durch die Verteilung der VMs auf mehrere Availability Zones würde er sicherstellen, dass ein Ausfall in einer Zone nicht die gesamte Anwendung betrifft.
- **Regions**: Er würde kritische Anwendungen in mehreren Regionen bereitstellen, um bei einem regionalen Ausfall die Verfügbarkeit zu gewährleisten.

**Wie viele VMs würden bei dem folgenden Szenario mit einer optimalen Aufteilung ausfallen?**

- **Regionsausfall**: Ein Senior Developer würde sicherstellen, dass bei einem Ausfall einer Region nur die Hälfte der VMs betroffen ist, indem er die VMs gleichmäßig auf zwei Regionen verteilt.
- **Zone 1 in Region 1**: Bei einem Ausfall von Zone 1 in Region 1 würden nur die VMs in dieser Zone betroffen sein, was bei einer gleichmäßigen Verteilung etwa 2-3 VMs entspricht.
- **Update Domain 1 hat Fehler**: Bei einem Fehler in Update Domain 1 würden nur die VMs in dieser Domain betroffen sein, was bei einer gleichmäßigen Verteilung etwa 1-2 VMs entspricht.
- **Eine Fault Domain in Zone 1 der Region 2 fällt aus**: Bei einem Ausfall einer Fault Domain in Zone 1 der Region 2 würde nur eine VM betroffen sein, wenn die VMs gleichmäßig auf die Fault Domains verteilt sind.

### Knacknuss: Architektur

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

## Voraussetzungen

**Installiertes Terraform**

```bash
terraform --version
```

**Installiertes Azure CLI**

```bash
az --version
```

**Melden Sie sich bei Ihrem Azure-Konto an und wählen Sie die richtige Subscription aus:**

```bash
az login
```
```
az account set --subscription="<subscription-id>"
```

## Schritt 2: Terraform Projekt einrichten

Erstellen Sie ein neues Verzeichnis für Ihr Terraform-Projekt und wechseln Sie in dieses Verzeichnis:

```bash
mkdir terraform-project
cd terraform-project
```

## Schritt 3: Terraform-Konfiguration erstellen

Erstellen Sie eine neue Datei namens `main.tf` und fügen Sie die grundlegende Konfiguration für den Azure-Provider hinzu:

```hcl
provider "azurerm" {
  features {}
  subscription_id = "1e8c48fb-7b50-41d8-bc34-83473faeb371"
}

resource "azurerm_resource_group" "DefaultResourceGroup_CCAN" {
  name     = "DefaultResourceGroup-CCAN"
  location = "Canada Central"
}

resource "azurerm_resource_group" "DefaultResourceGroup_EAU" {
  name     = "DefaultResourceGroup-EAU"
  location = "Australia East"
}

resource "azurerm_resource_group" "dev_rg_backup" {
  name     = "dev-rg-backup"
  location = "Australia East"
}

resource "azurerm_resource_group" "dev_rg_net" {
  name     = "dev-rg-net"
  location = "Australia East"
}

resource "azurerm_resource_group" "dev_rg_vm01_mmt" {
  name     = "dev-rg-vm01-mmt"
  location = "Australia East"
}

resource "azurerm_resource_group" "dev_rg_web01_as" {
  name     = "dev-rg-web01-as"
  location = "Australia East"
}

resource "azurerm_resource_group" "dev_rg_web01_db" {
  name     = "dev-rg-web01-db"
  location = "Australia East"
}

resource "azurerm_resource_group" "NetworkWatcherRG" {
  name     = "NetworkWatcherRG"
  location = "Australia East"
}

resource "azurerm_resource_group" "testdasfasdfke" {
  name     = "testdasfasdfke"
  location = "Australia East"
}

resource "azurerm_resource_group" "testdsafewak_group" {
  name     = "testdsafewak_group"
  location = "Canada Central"
}
```

## Schritt 4: Terraform initialisieren

Initialisieren Sie Terraform, um die Provider-Plugins herunterzuladen:

```bash
terraform init
```

## Schritt 5: Ressourcengruppen importieren

Führen Sie die `terraform import`-Befehle aus, um die Ressourcengruppen in den Terraform-Status zu importieren:

```bash
terraform import azurerm_resource_group.DefaultResourceGroup_CCAN /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/DefaultResourceGroup-CCAN
terraform import azurerm_resource_group.DefaultResourceGroup_EAU /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/DefaultResourceGroup-EAU
terraform import azurerm_resource_group.dev_rg_backup /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/dev-rg-backup
terraform import azurerm_resource_group.dev_rg_net /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/dev-rg-net
terraform import azurerm_resource_group.dev_rg_vm01_mmt /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/dev-rg-vm01-mmt
terraform import azurerm_resource_group.dev_rg_web01_as /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/dev-rg-web01-as
terraform import azurerm_resource_group.dev_rg_web01_db /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/dev-rg-web01-db
terraform import azurerm_resource_group.NetworkWatcherRG /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/NetworkWatcherRG
terraform import azurerm_resource_group.testdasfasdfke /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/testdasfasdfke
terraform import azurerm_resource_group.testdsafewak_group /subscriptions/1e8c48fb-7b50-41d8-bc34-83473faeb371/resourceGroups/testdsafewak_group
```

## Schritt 6: Terraform-Status überprüfen

Überprüfen Sie, ob die Ressourcen erfolgreich importiert wurden:

```bash
terraform state list
```

## Schritt 7: Ressourcen löschen

Führen Sie `terraform plan -destroy` aus, um zu sehen, welche Ressourcen gelöscht werden, und dann `terraform apply -destroy`, um die Ressourcen tatsächlich zu löschen:

```bash
terraform plan -destroy
terraform apply -destroy
```

Bestätigen Sie die Löschung, wenn Sie dazu aufgefordert werden.

Mit diesen Schritten können Sie bestehende Azure-Ressourcengruppen in Terraform importieren und löschen, um Ihre Infrastruktur als Code zu verwalten.

# Besvarelse: Unike ressursnavn og tags i Terraform

Dette dokumentet er delt i to prosesser. Først løser vi det kritiske problemet med unike ressursnavn. Deretter bygger vi videre på den løsningen for å legge til rike og informative tags.

---

## Del 1: Sikre unike ressursnavn

**Mål:** Unngå navnekonflikter ved å gi alle ressurser et unikt navneprefiks basert på et personlig `brukernavn`.

### Steg 1.1: Definer `brukernavn`-variabelen

Først legger vi til en variabel for det unike brukernavnet.

**Fil:** `environments/dev/variables.tf` (og tilsvarende for `prod`/`test`)
```terraform
variable "brukernavn" {
  type        = string
  description = "Et unikt brukernavn for studenten (f.eks. initialer) for å unngå navnekonflikter."
}
```

### Steg 1.2: Sett ditt `brukernavn`

I `.tfvars`-filen din, sett verdien for ditt brukernavn.

**Fil:** `environments/dev/dev.tfvars`
```terraform
brukernavn = "ab123"
```

### Steg 1.3: Oppdater `locals` og modulkall for unike navn

Nå bruker vi det nye brukernavnet til å bygge et unikt basisnavn (`rg_basename`) som sendes videre til alle modulene.

**Fil:** `environments/dev/main.tf`

**Før:**
```terraform
locals {
  rg_name = "rg-${var.environment}-${var.name_prefix}"
}
# ...
module "stack" {
  # ...
  name_prefix        = var.name_prefix
}
```

**Etter:**
```terraform
locals {
  # Bygger det unike basisnavnet
  rg_basename = "${var.name_prefix}-${var.brukernavn}"
  rg_name     = "rg-${var.environment}-${local.rg_basename}"
}
# ...
module "stack" {
  # ...
  name_prefix        = local.rg_basename   # Bruker det nye, unike basisnavnet
}
```
**Resultat etter Del 1:** Alle ressursene dine vil nå få et unikt navn, som f.eks. `rg-dev-demo-ab123`. Problemet med navnekonflikter er løst.

---

## Del 2: Legge til informative tags

**Mål:** Utvide løsningen fra Del 1 ved å legge til et standardisert sett med tags for eierskap og miljø.

### Steg 2.1: Definer `team`-variabelen

Vi legger til en ny variabel for team-tilhørighet.

**Fil:** `environments/dev/variables.tf`
```terraform
# Legg til denne variabelen (i tillegg til brukernavn)
variable "team" {
  type        = string
  description = "Navnet på teamet som eier ressursene."
}
```

### Steg 2.2: Sett ditt `team`

I `.tfvars`-filen legger du til teamet ditt.

**Fil:** `environments/dev/dev.tfvars`
```terraform
brukernavn = "ab123"
team       = "A-laget"
```
*(Merk: I `test.tfvars` ville du brukt `team = "B-laget"`, og i `prod.tfvars` `team = "C-laget"`)*

### Steg 2.3: Utvid `locals` og oppdater ressursene med tags

Vi utvider `locals`-blokken til å lage et `tags`-map, og sørger for at ressursene bruker dette.

**Fil:** `environments/dev/main.tf`

**Før (resultatet fra Del 1):**
```terraform
locals {
  rg_basename = "${var.name_prefix}-${var.brukernavn}"
  rg_name     = "rg-${var.environment}-${local.rg_basename}"
}

resource "azurerm_resource_group" "rg" {
  # ...
  tags     = var.tags
}

module "stack" {
  # ...
  tags     = var.tags
}
```

**Etter (endelig løsning):**
```terraform
locals {
  rg_basename = "${var.name_prefix}-${var.brukernavn}"
  rg_name     = "rg-${var.environment}-${local.rg_basename}"

  # Definerer et sett med tags for miljøet
  tags = {
    "environment" = var.environment,
    "owner"       = var.brukernavn,
    "team"        = var.team
  }
}

resource "azurerm_resource_group" "rg" {
  # ...
  tags     = local.tags # Bruker de nye tagsene
}

module "stack" {
  # ...
  tags     = local.tags # Bruker de nye tagsene
}
```
**Sluttresultat:** Du har nå en løsning med både **unike navn** (f.eks. `rg-dev-demo-ab123`) og **informative tags** (f.eks. `owner = "ab123"`, `team = "A-laget"`).

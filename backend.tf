terraform {
  cloud {
    organization = "Testnaga"

    workspaces {
      name = "dev-azure-myapp-dev"
    }
  }
}
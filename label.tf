module "label" {
  source  = "escapace/label/null"
  version = "1.6.0"

  attributes = ["terraform", "backend"]

  context = var.context
}

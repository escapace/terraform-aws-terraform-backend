module "label" {
  source     = "escapace/label/null"
  version    = "1.5.0"
  attributes = ["terraform", "backend"]

  context = var.context
}

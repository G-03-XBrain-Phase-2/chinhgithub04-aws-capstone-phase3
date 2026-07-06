module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  repositories = var.repositories
}

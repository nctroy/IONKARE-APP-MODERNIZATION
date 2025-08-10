module "baseline_network" {
  source = "../../../modules/baseline-network"
}

module "baseline_security" {
  source = "../../../modules/baseline-security"
}

module "baseline_logging" {
  source = "../../../modules/baseline-logging"
}

module "baseline_waf" {
  source = "../../../modules/baseline-waf"
}



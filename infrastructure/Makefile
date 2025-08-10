.PHONY: init validate plan destroy

INFRA_ROOT := $(CURDIR)
TF_DIR ?= aws/envs/interview

init:
	terraform -chdir=$(INFRA_ROOT)/$(TF_DIR) init -backend=false

validate:
	terraform fmt -check -recursive
	terraform -chdir=$(INFRA_ROOT)/$(TF_DIR) validate

plan:
	terraform -chdir=$(INFRA_ROOT)/$(TF_DIR) plan -lock=false -input=false -refresh=false -out=plan.tfplan

destroy:
	@echo "Placeholders only — nothing to destroy."



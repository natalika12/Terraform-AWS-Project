clean-up:
	find / -type d -name ".terraform" -exec rm -rf {} \;

virginia:
	terraform init && terraform apply -var-file region/virginia.tfvars   -auto-approve
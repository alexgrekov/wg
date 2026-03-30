#!/bin/bash

.venv/bin/ansible-playbook -Dv -e 'ansible_become_pass=$(cat sudo.password)' \
	--vault-password-file vault.password playbooks/deploy.yaml \
	--inventory inventory.yaml

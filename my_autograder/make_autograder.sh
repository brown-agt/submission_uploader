#!/usr/bin/env bash

# requires private key 'deploy_key' to give autograder git permissions
zip -r autograder.zip setup.sh ssh_config deploy_key run_autograder run_tests.py requirements.txt tests/*.py

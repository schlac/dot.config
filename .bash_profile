#!/bin/bash
# .bash_profile

# just load .profile and .bashrc

# Get the env vars
if [ -f ~/.profile ]; then
	. ~/.profile
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Set podman socket as docker
export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock

[[ -f /usr/local/ibmcloud/autocomplete/bash_autocomplete ]] && source /usr/local/ibmcloud/autocomplete/bash_autocomplete

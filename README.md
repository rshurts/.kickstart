# Kickstart

Use ansible to setup a laptop from scratch.

## Prerequisites

Kickstart needs an installation of ansible and git. macOS also requires homebrew.

**macOS**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
brew install ansible
```

**Ubuntu**

```bash
sudo apt update
sudo apt install software-properties-common git
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

## Running

Clone the kickstart repo to the home directory and run the playbook.

```bash
git clone https://github.com/rshurts/.kickstart.git
ansible-playbook ./.kickstart/local.yml --ask-become-pass
```

## Testing with Docker

Test additions in a fresh docker ubuntu environment.

1. `docker compose build`
1. `docker compose up`
1. `docker exec -it kickstart-kickstart-1 bash`
1. In the docker container `ansible-playbook ./.kickstart/local.yml`

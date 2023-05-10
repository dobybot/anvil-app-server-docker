# Dobybot anvil

# Setup

## 1. Copy private/public keys to root folder of this project
```bash
- root
    - anvil-data/
    - apps/
    - docker-volumes/
    - docker-compose.yml
    - Dockerfile
    - READMD.md
    - anvil_id_rsa           # <<< put private key here
    - anvil_id_rsa.pub       # <<< put public key here
```

## 2. Clone anvil apps into app folder
```bash
git clone -c "core.sshCommand=ssh -i anvil_id_rsa -F /dev/null" ssh://dobybot%40gmail.com@anvil.works:2222/ASA43J5YFLL4XGWM.git apps/MYDBBV2
git clone -c "core.sshCommand=ssh -i anvil_id_rsa -F /dev/null" ssh://dobybot%40gmail.com@anvil.works:2222/4IFZDSAEF2YQXDQ2.git apps/anvil_extras

# or
GIT_SSH_COMMAND='ssh -i anvil_id_rsa -o IdentitiesOnly=yes' git clone ssh://dobybot%40gmail.com@anvil.works:2222/ASA43J5YFLL4XGWM.git apps/MYDBBV2
GIT_SSH_COMMAND='ssh -i anvil_id_rsa -o IdentitiesOnly=yes' git clone ssh://dobybot%40gmail.com@anvil.works:2222/4IFZDSAEF2YQXDQ2.git apps/anvil_extras

```

## 3. Pull latest changes
```bash
cd apps/MYDBBV2 && git pull && cd ../..

# or
cd apps/MYDBBV2
GIT_SSH_COMMAND='ssh -i ../anvil_id_rsa -o IdentitiesOnly=yes' git pull
cd ../..
```

# 4. Setup docker-compose.yml (see docker-compose.example.yml)
Copy [docker-compose.example.yml](./docker-compose.example.yml) and rename to `docker-compose.yml` then
change `<YOUR_APP_NAME>`, `<YOUR_DATABASE_PASSWORD>`, ... to your settings

See more setting options in https://github.com/anvil-works/anvil-runtime#advanced-configuration

# 5. Start up docker containers

Run docker containers
```bash
docker-compose up -d
```

Check container status
```bash
docker-compose ps
```

View logs
```bash
docker-compose logs -f
```


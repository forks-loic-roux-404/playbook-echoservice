# Playbook ecoservice

Liste de roles à mettre en place sur une VM virtualbox
---
### Les rôles :
- php (configurable de 7.0 à 7.4)
- composer (Last version)
- phpunit (global)
- nodejs (LTS)
- nginx mainline (1.17 - not far to be stable)
- mysql 8 - `TODO:` fix password issue
- redis-server - `TODO:` not fully configured  

### Pour modifier le play book
- Clone src-ecs
- Clone le playbook
- Mettre le playbook dans `src-ecs/`
- Editer le Vagrantfile et passez la variable `folder` à `vagrant`
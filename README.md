# Running

```
pip install -r requirements.txt
# source secrets.sh # WARNING: Doesn't work!!! (see below)
export PYTHONPATH=$PWD # For secrets.py
ansible-playbook -i inventory playbook.yml
```

# Execute Playbook in Steps

This is mainly useful as a time saving measure if you want to
e.g. deploy repeatedly without reprovisioning.

```
ansible-playbook -i inventory playbook.yml --tags provision
ansible-playbook -i inventory playbook.yml --tags deploy
```

# Refresh the Dynamic Inventory Cache

```
./inventory/gce.py --refresh-cache
```

# Change Service Accounts

Remember to remove any `~/.google_libcloud_auth.*` files or else
you'll keep using the old credentials.

# On the use of secrets.sh vs. secrets.py

You'd think these would be interchangeable. However, if I use
`secrets.sh` instead of `secrets.py`, the inventory script doesn't
generate the proper output. Ansible doesn't see any hosts, and
produces a warning like:

```
[WARNING]: provided hosts list is empty, only localhost is available
```

And then the deploy play doesn't do anything.

TL;DR: Just use `secrets.py`.

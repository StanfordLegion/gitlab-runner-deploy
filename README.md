# Running

After cloning this repo, run:

```
pip install -r requirements.txt
source secrets.sh # see default.secrets.sh
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

Run this command if the deploy step fails with a message that there
are no hosts.

```
./inventory/gce.py --refresh-cache
```

# Change Service Accounts

If you change service accounts, remember to remove any
`~/.google_libcloud_auth.*` files or else you'll keep using the old
credentials.

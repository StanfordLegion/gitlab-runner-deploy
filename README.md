# Running

```
pip install -r requirements.txt
export PYTHONPATH=$PWD # for secrets.py
./inventory/gce.py --list
ansible-playbook -i inventory playbook.yml
```

# If You Change Service Accounts

Remember to remove any `~/.google_libcloud_auth.*` files or else
you'll keep using the old credentials.

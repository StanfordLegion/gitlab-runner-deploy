# First-Time Setup

 1. Go to Google Cloud console and search for "Service Accounts"
 2. Click "Create Service Account"
 3. Enter:
      * Name: legion
      * ID: legion (accept the default value)
      * Description: administer gitlab runner
 4. Click "Create and Continue"
 5. Enter:
      * Role: Editor
 6. Click "Continue"
 7. Click "Done" (skip the "Grant users access ..." dialogue)
 8. Under "Actions" click the vertical dots, then "Manage Keys"
 9. Click "Add Key", then "Create new key"
10. Enter:
      * Key type: JSON
11. Click "Create"
12. Store the downloaded key securely on the local machine
13. `cp default.secrets.sh secrets.sh`
14. Update `secrets.sh` with the resulting service account information

# Installation

Note: This creates a Conda installation and installs Ansible. (This
happens to be the most reliable way to get a version-pinned Ansible,
which is necessary to make sure everything is reproducible.)

```
./install.sh
```

# Running

```
source env.sh
source secrets.sh # see default.secrets.sh
ansible-playbook playbook.yml
```

# Execute Playbook in Steps

This is mainly useful as a time saving measure if you want to
e.g. deploy repeatedly without reprovisioning.

```
ansible-playbook playbook.yml --tags provision
ansible-playbook playbook.yml --tags deploy
```

# TODO

  * Figure out a way of automatically retrieving SSH host keys. One
    option inspired by [1][] would be to use the gcloud CLI to SSH to
    the node and exfiltrate the keys.

[1]: https://winscp.net/eng/docs/guide_google_compute_engine

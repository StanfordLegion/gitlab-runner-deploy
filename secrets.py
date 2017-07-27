import os

# This is a workaround for a bug in inventory/gce.py, the dynamic inventory
# script provider for Google Cloud. According to the documentation, it
# shouldn't matter how you configure the script: via environment variables, or
# a Python module. However, the environment variable GCE_ZONE serves a double
# purpose: it is required to specify the datacenter, but it also acts as a
# filter. Guess what: a datacenter is not a zone, so if you specify a
# datacenter, you won't get any instances at all!

# The workaround is to fetch the appropriate environment variables, feed them
# through, then delete the offending GCE_ZONE before it can do its damage.

# Why do we use the workaround instead of just using secrets.py directly?
# Because there are other environment variables we want to specify too.

GCE_PARAMS = (
    os.environ['GCE_EMAIL'],
    os.environ['GCE_PEM_FILE_PATH'],
)
GCE_KEYWORD_PARAMS = {
    'project': os.environ['GCE_PROJECT'],
    'datacenter': os.environ['GCE_ZONE'],
}
del os.environ['GCE_ZONE']

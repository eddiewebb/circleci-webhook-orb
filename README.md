# Webhook Orb

This orb attempts to improve upon the the legacy `notify: webhook` functionality of CircleCI.


## Caveats

The legacy webhook mocked the entire payload of our API v1.1 job results.  This orb author feels that a minimal payload with reference to lookup full job info is preferred.

If you depend on those fields, reference `api_link` from this webhook for the full details.


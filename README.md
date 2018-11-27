# Webhook Orb

This orb attempts to simplify and transition from the legacy `notify: webhook` functionality of CircleCI.

## Sample Output

```json
{
  "build_num": "231",
  "branch": "webhook",
  "username": "eddiewebb",
  "job": "build",
  "build_url": "https://circleci.com/gh/eddiewebb/circleci-samples/231",
  "vcs_revision": "8f59df978e3fa133a2ee39ff66b3382342ce958c",
  "reponame": "circleci-samples",
  "workflow_id": "6dfa1b01-96ef-430d-bc35-11b5d20a5127",
  "workflow_url": "https://circleci.com/workflow-run/6dfa1b01-96ef-430d-bc35-11b5d20a5127",
  "pull_request": null,
  "user": "eddiewebb",
  "api_link": "https://circleci.com/api/v1.1/project/eddiewebb/circleci-samples/231",
  "status": "success"
}
```

## Caveats

The legacy webhook mocked the entire payload of our API v1.1 job results.  This orb contains a minimal payload with reference to lookup full job (via `api_link`) if aditional fields are required.

Please [let me know by adding comments the discussion](https://github.com/eddiewebb/circleci-webhook-orb/issues/1) if you're missing a few specific fields or feel strongly about that decision.


## Feedback

I want it! Please open an issue and let me know how to improve.

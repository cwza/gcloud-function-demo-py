# Google Cloud Function Demo
>> Python Flask Server + Github Action + Google Cloud Function

## Main Purpose
* Simple flask server with simple test just for demo
* Github action to automatically run unit test on each push and pull request
* Github action to automatically deploy to google cloud function after each tag push

## Google Cloud Settings
1. Add a service account with these IAM
    + Cloud Functions Developer
    + Service Account user
2. Generate key from this service account and
    + Run `cat service_account_key.json | base64`
3. Set google cloud secret to github
    + secrets.GCP_PROJECT_ID: Your google cloud project id
    + secrets.GCP_SA_KEY: The base64 code generated from service account key from previous step
4. After first deployment
    + Remove default service account from this function
    + Add allUser to this cloud function
* Step 1, 2, 3: To grant google cloud function deployment privilege to github action.
* Step 4: Give the least permission and let this function be public accessible

## Github Action Settings
See .github/workflows/workflow.yaml
* jobs.test runs unit test on every push and pull request (including tag push)
* jobs.deploy runs deploy on every tag push

## Devlepment
* Add route at main.py, Add core logic at core.py, Add unit test for core at test.py
* Run `make test` for unit test
* Git add, commit, push to trigger CI to run unit-test
* Git tag -a v0.1, push tag to trigger CI to run unit-test and deploy to google cloud function

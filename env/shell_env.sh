export GCP_PROJECT=$(gcloud info --format='value(config.project)')
export TERRAFORM_SA=terraform-service-account
export TERRAFORM_SA_EMAIL=$(gcloud iam service-accounts list \
    --project=$GCP_PROJECT \
    --filter="displayName:$TERRAFORM_SA" \
    --format='value(email)')
export GOOGLE_APPLICATION_CREDENTIALS=/home/dada/.gcp/terraform-account.json

gcloud config set compute/zone asia-northeast1-a
gcloud config set project teraform-244604
gcloud container clusters get-credentials primary-microservice-test

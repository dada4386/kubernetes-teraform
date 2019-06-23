export GCP_PROJECT=$(gcloud info --format='value(config.project)')
export TERRAFORM_SA=terraform-service-account
export TERRAFORM_SA_EMAIL=$(gcloud iam service-accounts list \
    --project=$GCP_PROJECT \
    --filter="displayName:$TERRAFORM_SA" \
    --format='value(email)')
export GOOGLE_APPLICATION_CREDENTIALS=/home/dada/.gcp/terraform-account.json

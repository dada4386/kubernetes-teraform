# kubernetes-terraform

GKE(GCP) + terraformの勉強用のリポジトリです。
kubernetesの基本であるingress,service,podsに加えて
APIキー認証が可能なCloud Endpointを導入しています

また、CircleCIを使用してGCRへのdocker build,push
およびterraform applyも実施します(masterブランチのみ)

# ネットワーク構成 
![Architecture - Content Management_merge](https://user-images.githubusercontent.com/45912495/60396347-5ae8ce00-9b7b-11e9-8a14-77b0fbd40d34.png)

# Dependency
- TerraformのGCP権限 :
  ~/.gcp/terraform-account.jsonに以下の権限を付与したメンバーjsonを配置
    - Cloud Trace Agent
    - Compute Engine Admin
    - Kubernetes Engine Cluster Admin
    - Kubernetes Engine Developper
    - Service Accound User
    - Service Management Admin
    - Service Usage Admin
    - Strage Admin

default : terraform-service-account@teraform-244604.iam.gserviceaccount.com

# Setup
```
source ./kubernetes-teraform/env/shell_env.sh
```

# Usage
```
cd ./kubernetes-teraform/terraform
terraform init
terraform plan
terraform apply
```

# License
This software is released under the MIT License, see LICENSE.

# Authors
by dada


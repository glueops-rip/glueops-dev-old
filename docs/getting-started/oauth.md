---
id: oauth
title: Create the GitHub OAuth App
type: tutorial
---

In order to authenticate services deployed on the GlueOps Platform, you need to register GitHub OAuth app. This OAuth app will be installed in the organization that manages the GlueOps platform (likely owned by GlueOps) rather than the tenant's organization.

Before you begin, make sure you have the following information:

- Management GitHub Organization: The name of the GitHub organization that manages the GlueOps platform.

- Tenant Organization: The GitHub organization of the tenant.

- Captain Domain: The captain domain is provided by the GlueOps platform for tenant applications.

## Create the OAuth App ID

Now, let's proceed with creating the OAuth application:

1. Go to the GitHub settings page for your management organization by visiting the following URL: [https://github.com/organizations/glueops-rocks/settings/applications](https://github.com/organizations/glueops-rocks/settings/applications).

2. Click on **New Org OAuth App** to create a new OAuth application.

<img width="647" alt="new-oauth" src="https://github.com/GlueOps/glueops-dev/assets/39309699/3e18c227-61ef-48f7-a592-08818e3407f3"/>


3. Provide the following details for the OAuth app:

   - **Application name**: Enter a unique name for your OAuth app. It's recommended to include a reference to the tenant in the name for example "GlueOps-Dex."
   
   - **Homepage URL**: Specify the homepage URL for your OAuth app.

   - **Authorization callback URL**: Set the authorization callback URL for your OAuth app.

4. Once you have filled in the details, click on **Register application** to create the GitHub OAuth app.


<img width="500" alt="Screenshot 2023-07-19 at 15 04 33" src="https://github.com/GlueOps/glueops-dev/assets/39309699/a1053a22-7271-450a-8387-d1dc906cfc3f"/>

## Generate Client Secret

After registering the app, click on **Generate a new client secret** to generate 

<img width="541" alt="register_oauth" src="https://github.com/GlueOps/glueops-dev/assets/39309699/7dde0f95-7f28-4259-8d61-a4f77c693730"/>

## Retrieving values

The **Client ID** and **Client Secret** is what we need for the deployment of the `terraform-module-cloud-multy-prerequisites` module. 

- [github_oauth_app_client_id](#create-the-oauth-app-id)
- [github_oauth_app_client_secret](#generate-client-secret)

:::info
These two keys will be required when creating your cluster
:::


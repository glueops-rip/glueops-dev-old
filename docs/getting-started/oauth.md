---
id: oauth
title: Create the GitHub OAuth App
type: tutorial
---

Glueops authenticate services deployed on the Platform using the GitHub OAuth app. The GitHub app is installed within your GitHub Organization to provide secure access for your applications.

## Create the OAuth App ID

To create the OAuth App, follow these steps:

1. On your Github Organization page, go to the **Settings > Developers settings** and click on **Oauth Apps**.

2. Click on **New Org OAuth App** button to create a new OAuth application.

<img width="647" alt="new-oauth" src="https://github.com/GlueOps/glueops-dev/assets/39309699/3e18c227-61ef-48f7-a592-08818e3407f3"/>

3. Provide the following details for the OAuth app:

   - **Application name**: Enter a unique name for your OAuth app.
   
   - **Homepage URL**: Specify the homepage URL for your OAuth app.

   - **Authorization callback URL**: Set the authorization callback URL for your OAuth app.

4. Once you have filled in the details, click on **Register application** to create the GitHub OAuth app.

<img width="500" alt="Screenshot 2023-07-19 at 15 04 33" src="https://github.com/GlueOps/glueops-dev/assets/39309699/a1053a22-7271-450a-8387-d1dc906cfc3f"/>

Once your app is registed you'll receive your **OAuth App Client ID**

## Generate Client Secret

The client secret is a confidential value that is used for secure communication between your OAuth app and GitHub. To generate this:

In the OAuth app settings page, scroll down to the Client Secrets section and click on **Generate a new client secret**.

<img width="541" alt="register_oauth" src="https://github.com/GlueOps/glueops-dev/assets/39309699/7dde0f95-7f28-4259-8d61-a4f77c693730"/>

Once the client secret is generated, make sure to copy and securely store it.

## Retrieving values

By completing the above steps, you should have obtained the following values from the GitHub App:

- [github_oauth_app_client_id](#create-the-oauth-app-id): This is the Client ID of your GitHub OAuth app.
- [github_oauth_app_client_secret](#generate-client-secret): This is the Client Secret generated for your GitHub OAuth app.

These values will be used when deploying the [terraform-module-cloud-multy-prerequisites](https://github.com/GlueOps/terraform-module-cloud-multy-prerequisites) module.


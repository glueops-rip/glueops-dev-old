---
id: github-oauth
title: Create GitHub OAuth App
type: tutorial
---

# Creating your GitHub OAuth App

Glueops authenticate services deployed on the Platform using the GitHub OAuth app. The OAuth app is installed within your GitHub Organization to provide secure access to your applications.

To enable GlueOps authentication for your application, you need to provide the following values:

- [github_oauth_app_client_id](#create-the-oauth-app-id): This is the Client ID of your GitHub OAuth app.
- [github_oauth_app_client_secret](#generate-client-secret): This is the Client Secret generated for your GitHub OAuth app.

Follow the step-by-step guide below to obtain these values:

:::info
For each cluster you deploy with the GlueOps platform, you must create a new GitHub app.
:::

## 1. Create the OAuth App ID

To create the OAuth App, follow these steps:

1. On your Github Organization page, go to the **Settings > Developers settings** and click on **Oauth Apps**.

<img width="370" alt="Screenshot 2023-07-26 at 13 51 37" src="https://github.com/GlueOps/glueops-dev/assets/39309699/282e5bfc-16b9-4715-b6ce-99a23f4887d2"/>

2. Click on **New Org OAuth App** button to create a new OAuth application.

<img width="995" alt="Screenshot 2023-07-26 at 20 28 27" src="https://github.com/GlueOps/glueops-dev/assets/39309699/b8348e31-1695-4b61-bd22-fd1513411034"/>

3. Provide the following details for the OAuth app:

   - **Application name**: Enter a name for your OAuth app. GlueOps will provide the cluster name for you for easy identification. 
   
   - **Homepage URL**: Specify the homepage URL for your OAuth app. The homepage URLs have a common pattern ending with `onglueops.com`.

   - **Authorization callback URL**: Set the authorization callback URL for your OAuth app. Add `/callback` to the homepage URL that contains `onglueops.com` at the end.

   Sure, let's break down the information based on the customer name "Neptune" and the provided details:

  For example, let's assume we have a client called **Neptune**:
   
   - **Application Name**: `neptune-test-nonprod`, the term "nonprod" typically indicates a non-production or testing environment for applications
   - **Cluster name**: GlueOps will provide the cluster name `neptune.onglueops.com` 
   - **Captain domain**: The domain part that identifies your cluster is `nonprod.neptune.onglueops.com`
   - **Homepage URL**: `https://dex.test-nonprod.neptune.onglueops.com`
   - **Authorization callback URL**: `https://dex.test-nonprod.neptune.onglueops.com/callback`

4. Once you have filled in the details, click on **Register application** to create the GitHub OAuth app.

<img width="600" alt="Screenshot 2023-07-26 at 20 31 40" src="https://github.com/GlueOps/glueops-dev/assets/39309699/0b51eff1-a112-4bdb-98b0-1c88e579866c"/>

Once your app is registered you'll receive your **OAuth App Client ID**

## 2. Generate Client Secret

The client secret is a confidential value that is used for secure communication. To generate this:

In the OAuth app settings page, scroll down to the Client Secrets section and click on **Generate a new client secret**.

<img width="541" alt="register_oauth" src="https://github.com/GlueOps/glueops-dev/assets/39309699/6de6a13d-2a85-4dcf-b89d-e9c42ddda396"/>

Once the client secret is generated, make sure to copy and securely store it.

## Retrieving values

By completing the above steps, you should have obtained the following values from the GitHub OAuth App:

- [github_oauth_app_client_id](#create-the-oauth-app-id): This is the Client ID of your GitHub OAuth app.
- [github_oauth_app_client_secret](#generate-client-secret): This is the Client Secret generated for your GitHub OAuth app.

These values will be used when deploying your application with Glueops.
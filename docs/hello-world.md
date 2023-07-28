---
id: deploy-hello-world
title: Deploy a "Hello World" Application
type: tutorial
---

# Deploy a "Hello World" Application

In this guide, we will walk you through the process of deploying a "Hello World" application onto the GlueOps platform. The deployment process involves creating an application repository containing the app's code and configuring GitHub Actions to notify the GlueOps platform of the deployment. 

To get started:

1. Create a new repository for your application within your organization. You can have a simple folder structure like this:

```
├── .github
│   └── workflows
├── Dockerfile
├── README.md
└── index.html

```

2. The first action you need to perform is publishing a Docker image of your application. In the `github/workflows` folder create a file `ghcr.yaml` and copy and paste the following code:

```
name: GlueOps Action
 
on: [push]

jobs:
  build_tag_push_to_ghcr:
    runs-on: ubuntu-latest
    steps:
      - name: Build, Tag and Push Docker Image to GHCR
        uses: GlueOps/github-actions-build-push-containers@v0.1.2
```
:::tip
GlueOps only supports container images published to supported registry. As a happy path we have provide this [Custom Action to push Docker images to GitHub Container Registry](https://github.com/marketplace/actions/build-docker-image-and-push-to-ghcr).
:::

3. Define the different environments your application will be deployed to. For this example, we'll use three environments: prod, stage and uat. The structure will be now look like this:

```
.
├── .github
│   └── workflows
│       ├── ghcr.yaml
│       ├── prod-ci.yaml
│       ├── stage-ci.yaml
│       └── uat-ci.yaml
├── Dockerfile
├── README.md
└── index.html
```

4. Register these environments inside Argos CD (Continuous Deployment) configurations. Go to **Settings > Security > Secrets and Varibales > Actions**

<img width="422" alt="Screenshot 2023-07-28 at 02 47 16" src="https://github.com/GlueOps/glueops-dev/assets/39309699/f3468172-98cb-4b4f-a2fe-42e1006d772c"/>

5. Click on **New repository secret** to create a new token.

<img width="830" alt="Screenshot 2023-07-28 at 02 48 23" src="https://github.com/GlueOps/glueops-dev/assets/39309699/a4aca65d-483a-4b43-b55e-1a4080eb62e1"/>

6. To get your token secret Go to https://github.com/settings/tokens and click on Generate new token.

<img width="927" alt="Screenshot 2023-07-28 at 02 51 03" src="https://github.com/GlueOps/glueops-dev/assets/39309699/158bbb62-6710-4933-b076-1efb8d6bdc02"/>

7. Use the onscreen information to generate your token and the only scope required is the repo. Click on Generate token and copy your token

<img width="869" alt="Screenshot 2023-07-28 at 02 55 12" src="https://github.com/GlueOps/glueops-dev/assets/39309699/a7bca229-ed48-4679-ba45-6a863977820c"/>

8. Place your copied token in the secret input field and click add secret


<img width="870" alt="Screenshot 2023-07-28 at 02 58 50" src="https://github.com/GlueOps/glueops-dev/assets/39309699/a356b1c6-6040-46f0-9b50-c57a2b606dc2">

4. In your `index.html` file copy and paste the following simple **Hello World** code:

```
<html>
 <head>
 </head>
 <body>
   <h1>Hello World from demo-app-1<h1>
 </body>
</html>
```


2. Register these environments inside Argos CD (Continuous Deployment) configurations.

## Step 4: Writing Application Code

1. Add the necessary code to your application. For the demo, we'll create a simple "Hello World" application using HTML.
2. Don't forget to configure a GitHub token as a repository secret. This token is essential for running actions and notifying Argos CD of code changes.

## Step 5: Deploying the Application

1. Trigger the GitHub Action you set up to publish the Docker image based on the latest code changes.
2. The platform will automatically spin up a new environment and deploy the application.
3. You can check the status of the deployment on Argos CD, which will show metrics, logs, and more.

## Step 6: Deploying to Additional Environments

1. To deploy the application to other environments (e.g., UAT), create a release with an appropriate tag (e.g., v0.1.0).
2. This release will generate pull requests into the deployment repository, updating the corresponding environment with the new image.
3. Merge the pull request to trigger the deployment.

## Conclusion

Congratulations! You have successfully deployed a basic "Hello World" application onto the Globs platform. This guide provided a high-level overview of the deployment process, and we encourage you to explore further and adapt it to your specific needs. If you have any questions or encounter issues during the process, don't hesitate to reach out for support. Happy deploying!

*Note: This document is based on a specific demo session and may require adjustments for your specific use case.*
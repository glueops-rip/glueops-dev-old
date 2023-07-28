---
id: deploy-hello-world
title: Deploy a "Hello World" Application
type: tutorial
---

# Deploy a "Hello World" Application

In this guide, we will walk you through the process of deploying a "Hello World" application onto the GlueOps platform. We'll start from scratch and cover each step in detail to ensure you have a smooth deployment experience.

Step 1: Create a New Repository and set up your application folder

1. Create a new repository for your application within your organization. 

2. Create the necessary folders and files for your application. You can use the following folder structure:

```
demo-app-1
├── .github
│   └── workflows
├── Dockerfile
├── README.md
└── index.html
```
## Step 2: Set Up GitHub Actions for Docker Image Publishing

Now, let's configure GitHub Actions to automatically publish a Docker image of your application. This will allow the GlueOps platform to use the latest version of your app. Here's how you can set it up:

1. In your newly created repository, navigate to the `.github/workflows` folder.
2. Create a new file named `ghcr.yaml` in the `workflows` folder.
3. Copy and paste the following code into `ghcr.yaml`:

```yaml
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
GlueOps only supports container images published to the supported registry. As a happy path, we have provided this [Custom Action to push Docker images to GitHub Container Registry](https://github.com/marketplace/actions/build-docker-image-and-push-to-ghcr).
:::

## Step 3: Define Environments

In this step, we'll define the different environments your application will be deployed to. For this example, we'll use three environments: `prod`, `stage`, and `uat`. Organize your repository structure as follows:

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

4. Configure a GitHub token as a repository secret. This token is essential for running actions and notifying our Argo CD of code changes. Go to **Settings > Security > Secrets and Varibales > Actions**

<img width="422" alt="Screenshot 2023-07-28 at 02 47 16" src="https://github.com/GlueOps/glueops-dev/assets/39309699/f3468172-98cb-4b4f-a2fe-42e1006d772c"/>

5. Click on **New repository secret** to create a new token.

<img width="830" alt="Screenshot 2023-07-28 at 02 48 23" src="https://github.com/GlueOps/glueops-dev/assets/39309699/a4aca65d-483a-4b43-b55e-1a4080eb62e1"/>

6. To get your token secret Go to https://github.com/settings/tokens and click on Generate new token.

<img width="927" alt="Screenshot 2023-07-28 at 02 51 03" src="https://github.com/GlueOps/glueops-dev/assets/39309699/158bbb62-6710-4933-b076-1efb8d6bdc02"/>

7. Use the onscreen information to generate your token and the only scope required is the repo. Click on Generate token and copy your token

<img width="869" alt="Screenshot 2023-07-28 at 02 55 12" src="https://github.com/GlueOps/glueops-dev/assets/39309699/a7bca229-ed48-4679-ba45-6a863977820c"/>

8. Place your copied token in the secret input field and click add secret. Don't forget to 


<img width="870" alt="Screenshot 2023-07-28 at 02 58 50" src="https://github.com/GlueOps/glueops-dev/assets/39309699/a356b1c6-6040-46f0-9b50-c57a2b606dc2"/>

Next, deploy the app and register the specified enviroments, in our case (prod, stag, uat) inside of the our Argo CD. go to In the deployment-configurations repo.
in the app directory 

- We have two example demo apps deployed in the repo. Duplicate one of them and rename to your own application that you want to deploy. This is what your structure should look like
```
├── demo-app-1
├── base
│   └── base-values.yaml
├── envs
│   ├── previews
│   ├── prod
│   ├── stage
│   └── uat
```

in the `base-values.yaml` file in the `base` directory, change the information there to fit into your application. For our example our `base-values.yaml`  will look like this 

```
image:
  registry: ghcr.io
  repository: venkata-tenant-test-1/demo-app-1
  port: 80
```

Change venkata-tenant-test-1/demo-app-1 to match your organization and repository name.
:::

Within the `env` directorIn the `values.yaml` file in the `prod` folder copy and paste the following

```
image:
  tag: 'v0.2.0'
ingress:
  enabled: true
  ingressClassName: public
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt
  tls:
    - secretName: demo-app-1.yolo.venkatamutyala.com
      hosts:
        - demo-app-1.yolo.venkatamutyala.com
  entries:
    - name: public
      hosts:
        - hostname: demo-app-1.apps.test-80-np.venkata.onglueops.rocks
        - hostname: demo-app-1.yolo.venkatamutyala.com
```
- 

Change demo-app-1 to your repo name
Change venkatamutyala.com to your hosting name
Change test-80-np.venkata.onglueops.rocks to your cluster name provided by GlueOps

For the staging enviroment

```
image:
  tag: latest
ingress:
  enabled: true
  ingressClassName: public
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt
  tls:
    - secretName: demo-app-1-stage.yolo.venkatamutyala.com
      hosts:
        - demo-app-1-stage.yolo.venkatamutyala.com
  entries:
    - name: public
      hosts:
        - hostname: demo-app-1-stage.apps.test-80-np.venkata.onglueops.rocks
        - hostname: demo-app-1-stage.yolo.venkatamutyala.com
```
Change demo-app-1 to your repo name
Change venkatamutyala.com to your hosting name
Change test-80-np.venkata.onglueops.rocks to your cluster name provided by GlueOps

For uat 

```
image:
  tag: 'v0.1.0'
ingress:
  enabled: true
  ingressClassName: public
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt
  tls:
    - secretName: demo-app-1-uat.yolo.venkatamutyala.com
      hosts:
        - demo-app-1-uat.yolo.venkatamutyala.com
  entries:
    - name: public
      hosts:
        - hostname: demo-app-1-uat.apps.test-80-np.venkata.onglueops.rocks
        - hostname: demo-app-1-uat.yolo.venkatamutyala.com
```
Change demo-app-1 to your repo name
Change venkatamutyala.com to your hosting name
Change test-80-np.venkata.onglueops.rocks to your cluster name provided by GlueOps

Save and commit your changes to your deployment repository

Now let's go back to your repo and in your `index.html` file add a simple HTML World code. you can copy and paste the sample below:

```
<html>
 <head>
 </head>
 <body>
   <h1>Hello World from demo-app-1<h1>
 </body>
</html>
```

Commit and create a PR to Trigger the GitHub Action you set up to publish the Docker image based on the latest code changes. The platform will automatically spin up a new environment and deploy the application.

<img width="420" alt="Screenshot 2023-07-28 at 12 53 14" src="https://github.com/GlueOps/glueops-dev/assets/39309699/9661e169-6eee-4bec-a5ee-145751e40b6f"/>

If you want to see the app click on the preview URL. You can check the status of the deployment on Argos CD, which will show metrics, logs, and more. The QR code will also lead you to the preview URL.

## Deploying to Additional Environments

If you go back to your application you registred in the deployment configuration,  In `env` directory when you check the hostname in your in your stage folder you should be able to see your app

To deploy the application to prod and UAT, go to your repository and create a release with an appropriate tag (e.g., v0.1.0).This release will generate pull requests into the deployment repository, updating the corresponding environment with the new image.
Merge the pull request to trigger the deployment. Now your uat and prod host name link should be working 


<img width="362" alt="Screenshot 2023-07-28 at 13 19 12" src="https://github.com/GlueOps/glueops-dev/assets/39309699/5bc936a8-adcd-40f4-bdc8-ff8b3290ce0d"/>

## Conclusion

Congratulations! You have successfully deployed a basic "Hello World" application onto the GlueOps platform. 
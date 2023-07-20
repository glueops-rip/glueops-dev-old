---
id: deployment-configuration
title: Deployment Configurations
---

# Deployment Configurations: Setting Up Your Repository

The Deployment Configurations repository acts as a centralized hub for configurations used in deployments on the GlueOps Platform. This guide will walk you through the steps to set up your repository with detailed explanations to ensure a successful configuration.

## Directory Structure

The repository is organized into three core directories:

```sh
deployment-configurations
├── apps
├── common
├── env-overlays
```

- **apps**: Contains configurations for each application deployed on the GlueOps Platform.
- **common**: Holds configurations shared across all deployments on the platform. It allows you to avoid repetition of configuration files for more efficient setups.
- **env-overlays**: Contains configurations applied to groups of environments, like "prod" and "nonprod."

## `apps` Directory

The `apps` directory is used to define the applications deployed on the platform and the environments for each application. Each application is deployed into different environments, and configurations are managed accordingly.

For example:

```sh
apps
├── app1
│   ├── base
│   │   └── base-values.yaml
│   └── envs
│       ├── env1
│       ├── env2
│       └── env3
└── app2
    ├── base
    │   └── base-values.yaml
    └── envs
        ├── env1
        └── env2
```

The `base` directory contains configurations shared among all environments, while `envs` contains configurations specific to each environment.

## `env-overlays` Directory

The `env-overlays` directory contains directories referring to groups of environments and is used to configure items common to a set of environments but not all environments.

For example:

```sh
env-overlays
├── nonprod
│   └── env-values.yaml
└── prod
    └── env-values.yaml
```

The configurations within these directories apply to specific sets of environments.

## Creating Your `deployment-configurations` Repository

To set up your `deployment-configurations` repository:

1. Create a new repository using the provided [template](https://github.com/new?template_name=deployment-configurations&template_owner=GlueOps) in your GitHub organization.

2. Replace the sample application names (`app1` and `app2`) with the names of the applications you want to deploy.

3. Ensure that the names of each directory in the `apps` directory match the names of the associated application repositories that contain the application code.

4. Add new directories under `apps` for each additional application you want to deploy.

5. Customize the subdirectories under each application to reflect the environments for which each application will be deployed.

For instance, to deploy the applications `data-api` in `stage` and `prod` environments and `commerce-front-end` in `uat` and `prod` environments, the resulting directory structure would be as follows:

```sh
deployment-configurations
├── apps
│   ├── data-api
│   │   ├── base
│   │   │   └── base-values.yaml
│   │   └── envs
│   │       ├── stage
│   │       │   └── values.yaml
│   │       └── prod
│   │           └── values.yaml
│   └── commerce-front-end
│       ├── base
│       │   └── base-values.yaml
│       └── envs
│           ├── uat
│           │   └── values.yaml
│           └── prod
│               └── values.yaml
├── common
│   └── common-values.yaml
├── env-overlays
│   ├── nonprod
│   │   └── env-values.yaml
│   └── prod
│       └── env-values.yaml
```

By following these steps and organizing your configurations accordingly, you'll have a well-structured Deployment Configurations repository for your applications on the GlueOps Platform.
# Brief Intro to Repo

This repo is a short example on how to utilize Github Actions, to build simple CICD pipelines for their project. The example in this repo uses uses technologies such as Docker and Github Actions


# What is Docker
Docker allows you to create individual images with all the packages and libraries to containerize your application. Think of an image as your application and all the dependencies it needs zipped up in a tar file 

## Things to note about docker 

Metadata can be use

# Github Actions 
The github-actions-demo.yml command below executes whenever we push code to the prod or develop branch. You can add more branches or git commands depending on your unique workflow (More to come!)

```
on:
  push:
    branches:
      - prod
      - develop
```

A workflow comprises of one or more jobs that run in parallel.
Read more about jobs on [workflow-syntax-for-github-actions](https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobs) 


### Environment
Every CICD pipeline has different environments that separate code that is being developed and tested from code that is in production. An environment is used for targeting specific deployments such as production, staging, development. We can configure the environments by selecting Settings -> Environments -> New Environment

![](/assets/github_actions_environment.png)

Configure an environment and only execute the job if the branch name matches the environment name we set below. 

![](/assets/deployment_branches_settings.png)

This repository is configured with following 

The basic job below executes whenever the develop branch pushes code
```
jobs: 
  Development-Github-Action:
    runs-on: ubuntu-latest
    environment: develop
    steps:
      - run: echo "🎉 The job was automatically triggered For the dev branch by a ${{ github.event_name }} event."
      - name: Checkout repository code
        uses: actions/checkout@v2
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
```

The second job runs in parallel for only branches named prod.

```
jobs:
  Development-Github-Action:
    ...
  Prod-Github-Action:
    runs-on: ubuntu-latest
    environment: prod
    steps:
        -run: echo
```

### TBC...
---
layout: default
permalink: /serverless/
---

<img src="/img/serverless-logo.png">

# Kubeless Serverless Plugin

Kubeless has a [serverless](https://serverless.com/) plugin managed upstream at [https://github.com/serverless/serverless-kubeless](https://github.com/serverless/serverless-kubeless).

## Installation

Install the serverless framework, clone the plugin repository and install it:

```
npm install serverless -f
git clone https://github.com/serverless/serverless-kubeless
cd serverless-kubeless
npm install
```

## Usage

Check the example. Notice that the provider is called `google`, this is not a mistake and is due to a [limitation](https://github.com/serverless/serverless/issues/3611) in the upstream serverless code that should be removed soon.

```
cd examples
cat serverless.yml
service: hello

provider:
  name: google
  runtime: python2.7

plugins:
  - kubeless-serverless

functions:
  hello:
    handler: handler.hello
```

Set your Kubernetes endpoint via the `K8SAPISERVER` variable:

```
export K8SAPISERVER=https://192.168.99.100:8443
```

Deploy the function with:

```
serverless deploy
Serverless: Packaging service...
Serverless: Deploying function: hello...
```

Remove the function with:

```
serverless remove
```


---
layout: default
permalink: /serverless/
---

<img src="/img/serverless-logo.png">

# Kubeless Serverless Plugin

Kubeless has a [serverless](https://serverless.com/) plugin managed upstream at [https://github.com/serverless/serverless-kubeless](https://github.com/serverless/serverless-kubeless).

## Installation

Install the serverless framework executing the command bellow:

```
npm install serverless -g
```

## Usage

You can clone the repository and check the examples.

```
git clone https://github.com/serverless/serverless-kubeless
cd serverless-kubeless/examples/post-python
cat serverless.yml
service: echo

provider:
  name: kubeless
  runtime: python2.7

plugins:
  - serverless-kubeless

functions:
  hello:
    handler: handler.hello
```

First you need to download the dependencies:
```
npm install
```

Then deploy the function with:

```
serverless deploy
Serverless: Packaging service...
Serverless: Deploying function: hello...
Serverless: Function hello successfully deployed
```

Now you will be able to call the function:

```
serverless invoke -f echo -l --data '{"hello": "world"}'
Serverless: Calling function: echo...
--------------------------------------------------------------------
{ hello: 'world' }
```

For more details visit the [GitHub repository](https://github.com/serverless/serverless-kubeless).

---
title: Kubeless
description: Kubeless is a Kubernetes-native serverless framework
layout: index
---

`kubeless` is a Kubernetes-native serverless framework. It runs on top of your Kubernetes cluster and allows you to deploy small unit of code without having to build container images. With kubeless you can build advanced applications that tie together services using functions.

We believe that Kubeless is the most Kubernetes native serverless implementation available. Kubeless is built on top of Kubernetes from scratch and is making use of core Kubernetes primitives (e.g deployments, services, configmaps, ingress), this allows us to benefit directly from the Kubernetes core and to not re-invent the wheel. In addition, Kubeless makes use of Prometheus for monitoring functions calls. This is built directly in the runtimes.

## Architecture

Kubeless uses the Kubernetes controller framework. We extend the Kubernetes API using a ThirdPartyResource function definition (migration to Custom Resource Defintion is under way) to create a new _Function_ object Kind. Our controller is running in the cluster as a standard deployment then watches the _Function_ endpoints and launches _runtimes_ containing the function code. Functions are injected into our default runtimes using ConfigMaps. Dependencies are currently handled using init-containers. These containers fetch all the dependencies and share them with the function runtimes using volumes.

The runtimes are pre-built docker images that wrap the functions in an HTTP server or in a Kafka consumer. Indeed, to be able to trigger functions via events we currently use [Kafka](https://kafka.apache.org).

## Features

* Python ,Node.js and Ruby support.
* CLI compliant with AWS Lambda CLI.
* Event triggers using Kafka messaging system.
* Prometheus monitoring of functions calls and function latency by default.
* Serverless [plugin](https://github.com/serverless/serverless-kubeless.git)
* Web based [UI](https://github.com/kubeless/kubeless-ui)

## Issues

If you experience any problems please file an [issue](https://github.com/kubeless/kubeless/issues).

Any help welcome, please join the project

## Roadmap

* Add Opentracing support.
* Add additional language runtimes.
* Improve dependency handling via builtin registry and dynamic environment creation.
* Provide Functions repository (see [https://github.com/kubeless/functions](https://github.com/kubeless/functions).
* Provide additional event system as plugins (e.g nats.io, redis, RabbitMQ).
* Provide function authentication support.
* Ability to add Ingress rules to subset of functions. (**DONE** in v0.1.0)

## Screencasts

Demo of event based function triggers with Minio. Click on the picture below to play the screencast.

[![screencast](https://img.youtube.com/vi/AxZuQIJUX4s/0.jpg)](https://www.youtube.com/watch?v=AxZuQIJUX4s)

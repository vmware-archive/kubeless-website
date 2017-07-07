---
layout: default
---

# Kubeless

`kubeless` is a Kubernetes-native serverless framework. It is currently under active development lead by the Kubernetes group at [Bitnami](https://bitnami.com/kubernetes), the most up-to-date version is `HEAD`. If you experience any problems during this growing phase please file an [issue](https://github.com/kubeless/kubeless/issues) and we will get back to you as quickly as we can.

There are other solutions, like [OpenWhisk](https://github.com/openwhisk/openwhisk) currently in incubation at the Apache Software Foundation. However, rwe believe that Kubeless is the most Kubernetes native of all. Kubeless is built on top of Kubernetes from the scratch and is making use of core Kubernetes primitives (e.g deployments, services, configmaps, ingress), this allows us to benefit directly from the Kubernetes core and to not re-invent the wheel. In addition, Kubeless makes use of Prometheus for monitoring functions calls. This is built directly in the runtimes.

## Architecture

Kubeless uses the Kubernetes controller framework. We extend the Kubernetes API using the ThirdPartyResources objects (migration to Custom Resource Defintion is under way) to create a new _Function_ object Kind. Our controller running in the cluster as a standard deployment then watches the _Function_ endpoints and launches _runtimes_ containing the function code. Functions are injected into our default runtimes using ConfigMaps. Dependencies are currently handled using init-containers. These containers fetch all the dependencies and share them with the function runtimes using volumes.

The runtimes are pre-built docker images that wrap the functions in an HTTP server or in a Kafka consumer. Indeed to be able to trigger functions via events we use [Kafka](https://kafka.apache.org) similarly to OpenWhisk.

## Features

* Python and Node.js support. 
* CLI compliant with AWS Lambda CLI.
* Event triggers using Kafka messaging system.
* Prometheus monitoring of functions calls and function latency by default.
* Serverless [plugin](https://github.com/serverless/serverless-kubeless.git)
* Web based [UI](https://github.com/kubeless/kubeless-ui)

## Roadmap

* Add Opentracing support.
* Add additional language runtimes.
* Improve dependency handling via builtin registry and dynamic environment creation.
* Provide Functions repository.
* Provide additional event system as plugins (e.g nats.io, redis, RabbitMQ).
* Provide function authentication support.
* Ability to add Ingress rules to subset of functions.

## Screencasts

Demo of event based function triggers with Minio.

[![screencast](https://img.youtube.com/vi/AxZuQIJUX4s/0.jpg)](https://www.youtube.com/watch?v=AxZuQIJUX4s)


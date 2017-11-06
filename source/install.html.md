---
title: Kubeless Install
description: Installation steps for Kubeless
layout: page
---

# Pre-requisites

Kubeless runs on [Kubernetes](https://kubernetes.io), you need a working Kubernetes cluster to run kubeless.
For testing you can use [minikube](https://github.com/kubernetes/minikube).

# Installation

Installing `kubeless` is a three step process:

* Create a `kubeless` namespace:

```console
kubectl create ns kubeless
```

* Download `kubeless` from [release page](https://github.com/kubeless/kubeless/releases).
* Create the `kubeless` manifests:

```console
curl -sL https://github.com/kubeless/kubeless/releases/download/v0.2.3/kubeless-v0.2.3.yaml | kubectl create -f -
```

This last step will launch the controller, a deloyment and expose it via a service. It will also launch a Kafka and Zookeper development setup to handle the default messages. Finally, it will create a _function_ ThirdPartyResource.

```console
$ kubectl get pods -n kubeless
NAME                                   READY     STATUS    RESTARTS   AGE
kafka-0                                1/1       Running   0          1m
kubeless-controller-3331951411-d60km   1/1       Running   0          1m
zoo-0                                  1/1       Running   0          1m

$ kubectl get deployment -n kubeless
NAME                  DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
kubeless-controller   1         1         1            1           1m

$ kubectl get statefulset -n kubeless
NAME      DESIRED   CURRENT   AGE
kafka     1         1         1m
zoo       1         1         1m

$ kubectl get customresourcedefinition
NAME               KIND
functions.k8s.io   CustomResourceDefinition.v1beta1.apiextensions.k8s.io

$ kubectl get functions
```

# Uninstall

You can uninstall all `kubeless` components by removing all existing functions first (this will insure that all configmaps, deployments and services corresponding to the functions are removed) and then removing the `kubeless` namespace directly:

```
kubeless function delete <function_name>
kubectl delete ns kubeless
```

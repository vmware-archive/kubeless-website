---
layout: default
permalink: /install/
---

# Installation

Installing `kubeless` is a three step process:

* Create a `kubeless` namespace: `kubectl create ns kubeless`
* Download `kubeless from [release page](https://github.com/kubeless/kubeless/releases).
* Create the `kubeless` manifests: `kubectl create -f`

This last step will launch the controllern a deloyment and expose it via a service. It will also launch a Kafka and Zookeper development setup to handle the default messages. Finally, it will create a _function_ ThirdPartyResource.

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

$ kubectl get thirdpartyresource
NAME             DESCRIPTION                                     VERSION(S)
function.k8s.io   Kubeless: Serverless framework for Kubernetes   v1

$ kubectl get functions
```

# Uninstall

You can uninstall all `kubeless` components by removing all existing functions first (this will insure that all configmaps, deployments and services corresponding to the functions are removed) and then removing the `kubeless` namespace directly:

```
kubeless function delete <function_name>
kubectl delete ns kubeless
```

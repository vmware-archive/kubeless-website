---
layout: default
permalink: /install/
---

# Installation

Download `kubeless` from the [release page](https://github.com/kubeless/kubeless/releases). Then launch the controller. It will ask you if you are OK to do it. It will create a _kubeless_ namespace and a _function_ ThirdPartyResource. You will see a _kubeless_ controller, and _kafka_, _zookeeper_ statefulset running.

```console
$ kubeless install
We are going to install the controller in the kubeless namespace. Are you OK with this: [Y/n]

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



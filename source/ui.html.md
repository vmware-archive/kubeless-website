---
title: Kubeless UI
description: Graphical User Interface for kubeless
layout: page
---

# Graphical User Interface

Kubeless as a Web based UI available at [https://github.com/kubeless/kubeless-ui](https://github.com/kubeless/kubeless-ui). It is a react-redux application that lets you edit and create function, check the logs and send small payload for testing.


## Launch the UI

If you want to run the UI locally, check the [README](https://github.com/kubeless/kubeless-ui/blob/master/README.md), otherwise you can launch the UI directly within your Kubernetes cluster using a manifest like so:

```
kubectl create -f https://raw.githubusercontent.com/kubeless/kubeless-ui/master/k8s.yaml
```

The service is a NodePort for straightforward testing on minikube.

## Access the UI

On minikube this will be:

```
minikube service ui -n kubeless
```

And you will then access the UI below:

<img src="assets/images/kubeless-ui.png">

---
layout: default
---

# Kubeless

`kubeless` is a Kubernetes-native serverless framework. It is currently under active development, the most up-to-date version is `HEAD`. If you experience any problems during this growing phase please file an [issue](https://github.com/kubeless/kubeless/issues) and we will get back to you as quickly as we can.

There are other solutions, like [fission](http://fission.io) from Platform9, [funktion](https://github.com/fabric8io/funktion) from Fabric8. There is also an incubating project at the ASF: [OpenWhisk](https://github.com/openwhisk/openwhisk). We believe however, that Kubeless is the most Kubernetes native of all.

Kubeless stands out as we use a **ThirdPartyResource** to be able to create functions as custom resources. We then run an in-cluster controller that watches these custom resources and launches _runtimes_ on-demand. These runtimes, dynamically inject the functions and make them available over HTTP or via a PubSub mechanism.

For PubSub we use [Kafka](https://kafka.apache.org). Currently we start Kafka and Zookeeper in a non-persistent setup. With `kubeless` you can create topics, and publish events that get consumed by the runtime and your even triggered functions.

## Screencasts

Demo of event based function triggers with Minio.

[![screencast](https://img.youtube.com/vi/AxZuQIJUX4s/0.jpg)](https://www.youtube.com/watch?v=AxZuQIJUX4s)

Also check our [UI](https://github.com/kubeless/kubeless-ui) project

## Usage

You can use the CLI to create a function. Functions have two possible types:

* http trigger (function will expose an HTTP endpoint)
* pubsub trigger (function will consume event on a specific topic)

### HTTP function

Here is a toy function:

```python
def foobar(context):
   print context.json
   return context.json
```

You create it with:

```
$ kubeless function deploy get-python --runtime python27 \
                                --handler test.foobar \
                                --from-file test.py \
                                --trigger-http
```

You will see the function custom resource created:

```console
$ kubectl get functions
NAME          KIND
get-python    Function.v1.k8s.io
```

You can then call the function with:

```
$ kubeless function call get-python --data '{"echo": "echo echo"}'
Connecting to function...
Forwarding from 127.0.0.1:30000 -> 8080
Forwarding from [::1]:30000 -> 8080
Handling connection for 30000
{"echo": "echo echo"}
```

Or you can curl directly, for example (using minikube):

```
$ curl --data '{"Another": "Echo"}' $(minikube service get-python --url) --header "Content-Type:application/json"
{"Another": "Echo"}
```

### PubSub function

Messages need to be JSON messages. A function can be as simple as:

```python
def foobar(context):
    print context.json
    return context.json
```

You create it the same way than an _HTTP_ function except that you specify a `--trigger-topic`.

```
$ kubeless function deploy test --runtime python27 \
                                --handler test.foobar \
                                --from-file test.py \
                                --trigger-topic <topic_name>
```

### Other commands

You can delete and list functions:

```
$ kubeless function delete <function_name>
$ kubeless function ls
```

You can create, list and delete PubSub topics:

```
$ kubeless topic create <topic_name>
$ kubeless topic delete <topic_name>
$ kubeless topic ls
```


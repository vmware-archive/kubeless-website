---
title: Kubeless Examples
description: Some examples of usage for kubeless
layout: page
---

# Examples

Functions are deployed via the `kubeless` CLI. Functions have two possible types:

* http trigger (functions will expose an HTTP endpoint)
* event trigger (functions will consume events on a specific broker topic)

## HTTP triggered functions

Below is a toy function, save it in a file called `test.py`:

```python
def foobar(request):
   print request.json
   return request.json
```

You deploy it with the following command:

```
$ kubeless function deploy post-python --runtime python2.7 \
                                      --handler test.foobar \
                                      --from-file test.py \
                                      --trigger-http
```

You will see the function custom resource created:

```console
$ kubectl get functions
NAME          KIND
post-python    Function.v1.k8s.io
```

You can then call the function with:

```
$ kubeless function call post-python --data '{"echo": "echo echo"}'
Connecting to function...
Forwarding from 127.0.0.1:30000 -> 8080
Forwarding from [::1]:30000 -> 8080
Handling connection for 30000
{"echo": "echo echo"}
```

Or you can curl directly, for example (using `kubectl proxy`):

```
$ kubectl proxy
Starting to serve on 127.0.0.1:8001
```
```
$ curl --data '{"Another": "Echo"}' http://127.0.0.1:8001/api/v1/namespaces/default/services/post-python/proxy/ --header "Content-Type:application/json"
{"Another": "Echo"}
```

## Event triggered functions

Messages need to be JSON messages. A function can be as simple as:

```python
def foobar(context):
    print context.json
    return context.json
```

You create it the same way than an _HTTP_ function except that you specify a `--trigger-topic`.

```
$ kubeless function deploy test --runtime python2.7 \
                                --handler test.foobar \
                                --from-file test.py \
                                --trigger-topic <topic_name>
```

## Other commands

You can delete and list functions:

```
$ kubeless function delete <function_name>
$ kubeless function ls
```

You can create, list and delete topics available in the message broker:

```
$ kubeless topic create <topic_name>
$ kubeless topic delete <topic_name>
$ kubeless topic ls
```

## More Examples

More advanced [examples](https://github.com/kubeless/kubeless/tree/master/examples) are available in the GitHub repository (e.g Minio thumbnail creator, SLACK notifications, Twitter etc).

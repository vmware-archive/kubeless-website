---
layout: default
permalink: /examples/
---

Functions are deployed via the `kubeless` CLI. Functions have two possible types:

* http trigger (functions will expose an HTTP endpoint)
* event trigger (functions will consume events on a specific broker topic)

## HTTP triggered functions

Here is a toy function:

```python
def foobar(request):
   print request.json
   return request.json
```

You create it with:

```
$ kubeless function deploy post-python --runtime python27 \
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
$ kubeless function call post-python --data '{"echo": "echo echo"}'
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

## Event triggered functions

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


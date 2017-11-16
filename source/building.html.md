---
title: Kubeless build
description: Kubeless building process
layout: page
---

# Building

## Building with Golang

- you need go v1.7+
- if your working copy is not in your `GOPATH`, you need to set it accordingly.
- use the provided a Makefile.

~~~
$ git clone https://github.com/kubeless/kubeless.git
$ cd kubeless
$ make binary
~~~

You can build kubeless for multiple platforms with:

~~~
$ make binary-cross
~~~

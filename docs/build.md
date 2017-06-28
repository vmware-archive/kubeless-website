---
layout: default
permalink: /build/
---

# Building

## Building with go

- you need go v1.7+
- if your working copy is not in your `GOPATH`, you need to set it accordingly.
- we provided Makefile.

```
$ make binary
```

You can build kubeless for multiple platforms with:

```
$ make binary-cross
```

## Download kubeless package

```
$ go get -u github.com/kubeless/kubeless
```

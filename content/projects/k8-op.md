---
title: "Kubernetes Operator"
date: 2024-05-06T14:22:20-04:00
draft: false
---

*Ping Pong between HTTP Servers*

[View Codebase »](https://github.com/codingwithcarl/kubernetes_operator)

![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.freelogovectors.net%2Fwp-content%2Fuploads%2F2018%2F11%2Fkubernetes-logo.png&f=1&nofb=1&ipt=ce9689ab3b0343e9f3020d639d3b4ce7315de406496cc54c63c309c71732c944&ipo=images)

Example of simulated peering between http servers using a [Kubernetes Operator](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)

### Built With

* [kubectl & kind or minikube](https://kubernetes.io/docs/tasks/tools/)
* [Docker](https://www.docker.com/)
* [Operator SDK](https://sdk.operatorframework.io/)
* [Go](https://go.dev/)
* [Python](https://python.org/)

<!-- GETTING STARTED -->
## Getting Started

View the `setup.md` in the repository for prerequisites and installation.


<!-- USAGE EXAMPLES -->
## Usage

Run the deployment step, and verify the deployment using kubectl. The pod should run the http server and communicate with the other pods running the same type of http server. Every time a server pings, the responding server will log "pong".

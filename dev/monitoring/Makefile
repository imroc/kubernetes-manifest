SHELL := /bin/bash

.PHONY: install
install:
	kustomize build . | kubectl apply -f -

.PHONY: uninstall
uninstall:
	kustomize build . | kubectl delete -f -
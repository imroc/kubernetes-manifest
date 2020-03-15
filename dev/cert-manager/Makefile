SHELL := /bin/bash

.PHONY: install
install:
	kustomize build . | kubectl apply --validate=false -f -
	
.PHONY: uninstall
uninstall:
	kustomize build . | kubectl delete --validate=false -f -
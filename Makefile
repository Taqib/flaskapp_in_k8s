# Variables
IMAGE_NAME=your-docker-hub-username/flask-app
KUBE_NAMESPACE=default

# Targets
all: build push deploy

build:
    docker build -t $(IMAGE_NAME) .

push:
    docker push $(IMAGE_NAME)

deploy:
    kubectl apply -f deployment.yaml --namespace $(KUBE_NAMESPACE)

clean:
    kubectl delete -f deployment.yaml --namespace $(KUBE_NAMESPACE)

.PHONY: all build push deploy clean

REPO=fyndiq
NAME=python-confluent-kafka
TAG=1.3.0-python3.8-buster-v2
IMAGE=$(REPO)/$(NAME):$(TAG)

build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(REPO)/$(NAME):latest

run:
	docker run -it --rm $(IMAGE) bash

push:
	docker push $(IMAGE)
	docker push $(REPO)/$(NAME):latest

pip-update:
	pip-compile requirements.in --output-file requirements.txt

username ?= mrbarker
imagename ?= exercism-python
tag ?= 0.1.1

all: build

build:
	docker build -t $(username)/$(imagename):$(tag) .	

login:
	DOCKER_ID_USER="$(username)" docker login

push: build
	docker push $(username)/$(imagename):$(tag)

run:
	docker run --rm -it -v $(CURDIR):/root/exercism $(username)/$(imagename):$(tag)


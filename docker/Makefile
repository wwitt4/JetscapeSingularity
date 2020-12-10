TAG_BASE=bardelch/jetscape-prereq
TAG_BASE_buster=bardelch/jetscape-prereq:buster
TAG_BASE_ubuntu=bardelch/jetscape-prereq:ubuntu
TAG_JETSCAPE=bardelch/jetscape-compiled:singularity

all: submodule build push

clean:

build: base jetscape

submodule:
	cd ..
	git submodule init
	git submodule update

base:
	docker build -f Dockerfile-prereq -t $(TAG_BASE) .

buster:
	docker build -f Dockerfile-prereq-buster -t $(TAG_BASE_buster) .
	docker push $(TAG_BASE_buster)

ubuntu:
	docker build -f Dockerfile-prereq-ubuntu -t $(TAG_BASE_ubuntu) .
	docker push $(TAG_BASE_ubuntu)

jetscape:
	docker build -f Dockerfile.deploy -t $(TAG_JETSCAPE) .

push:
	docker push $(TAG_BASE)
	docker push $(TAG_JETSCAPE)

run:
	docker run -it $(TAG_BASE)

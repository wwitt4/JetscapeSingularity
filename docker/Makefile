TAG_BASE=bardelch/jetscape-prereq:singularity
TAG_JETSCAPE=bardelch/jetscape-compiled:singularity

all: build push

clean:

build:
	docker build -f Dockerfile-prereq -t $(TAG_BASE) .
	docker build -f Dockerfile.deploy -t $(TAG_JETSCAPE)

push:
	docker push $(TAG_BASE)
	docker push $(TAG_JETSCAPE)

run:
	docker run -it $(TAG_BASE)

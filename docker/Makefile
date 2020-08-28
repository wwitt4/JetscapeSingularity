TAG_BASE=bardelch/jetscape-prereq:singularity

all: build push

clean:

build:
	docker build -f Dockerfile-prereq -t $(TAG_BASE) .
push:
	docker push $(TAG_BASE)
run:
	docker run -it $(TAG_BASE)

TAG_BASE=bardelch/jetscape-prereq
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

jetscape:
	docker build -f Dockerfile.deploy -t $(TAG_JETSCAPE) .

push:
	docker push $(TAG_BASE)
	docker push $(TAG_JETSCAPE)

run:
	docker run -it $(TAG_BASE)

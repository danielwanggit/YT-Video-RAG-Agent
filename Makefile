IMAGE_BASE := docker.home.rift-way.win/homelab/n8n-python
VERSION_FILE := .version

# Load version from file or initialize
CURRENT_VERSION := $(shell [ -f $(VERSION_FILE) ] && cat $(VERSION_FILE) || echo "1.102.1-0")

# Extract numeric suffix and increment it
BASE_VERSION := $(shell echo $(CURRENT_VERSION) | cut -d '-' -f1)
PATCH := $(shell echo $(CURRENT_VERSION) | cut -d '-' -f2)
NEXT_PATCH := $(shell expr $(PATCH) + 1)
NEXT_VERSION := $(BASE_VERSION)-$(NEXT_PATCH)

.PHONY: build push

build:
	cd custom-n8n-image && \
	docker build -t $(IMAGE_BASE):$(NEXT_VERSION) . && \
	cd .. && \
	echo $(NEXT_VERSION) > $(VERSION_FILE)
	

push: build
	docker push $(IMAGE_BASE):$(NEXT_VERSION)

restart:
	docker compose down
	docker compose up -d

restart_log: restart
	docker compose logs -f


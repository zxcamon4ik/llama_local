myUID := $(shell id -u)


.PHONY: echo-i-uid
echo-i-uid:
	@echo ${myUID}

.PHONY: d-llama
d-llama:
	make d-run

.PHONY: d-run
d-run:
	@export myUID=${myUID} && \
	COMPOSE_PROFILES=full_dev \
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker-compose up \
			--build

.PHONY: d-purge
d-purge:
	@export myUID=${myUID} &&\
	COMPOSE_PROFILES=full_dev \
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker compose down --volumes --remove-orphans --rmi local --timeout 0
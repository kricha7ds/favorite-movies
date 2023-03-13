start:
	rails server -b 0.0.0.0

docker_start:
	docker compose up

docker_build:
	docker compose build

.PHONY: docker_start, docker_build

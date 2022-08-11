.PHONY: build stop attach

build:
	docker build -t mynginx .

stop:
	docker stop mynginx

attach:
	docker exec -it mynginx bash

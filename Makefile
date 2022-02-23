.PHONY: up
up:
	docker run --name marp --rm -ditv ${PWD}:/home/marp/app -p 8080:8080 marpteam/marp-cli -s -p .

.PHONY: down
down:
	docker rm --force marp

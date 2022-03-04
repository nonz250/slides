.PHONY: up
up:
	docker run --name marp --rm -ditv ${PWD}:/home/marp/app -p 8080:8080 marpteam/marp-cli -s -p .

.PHONY: down
down:
	docker rm --force marp

.PHONY: login
login:
	docker exec -it marp ash

.PHONY: ogp
ogp:
	docker run --rm -itv ${PWD}:/home/marp/app marpteam/marp-cli --image jpeg slides
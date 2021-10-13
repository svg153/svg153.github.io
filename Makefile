.PHONY: all up
all up:
	@docker-compose up -d

.PHONY: down
down:
	@docker-compose down

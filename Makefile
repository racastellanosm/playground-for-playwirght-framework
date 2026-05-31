SHELL				:= /bin/bash
UID 				:= $(shell id -u)
GID 				:= $(shell id -g)
DOCKER_COMPOSE		:= docker compose -f docker-compose.yml

# Colors using ANSI escape sequences
GREEN  := \033[1;32m
RED    := \033[1;31m
YELLOW := \033[1;33m
RESET  := \033[0m

help: ## Show this help message
	@printf "$(GREEN)-------------- USAGE --------------------------------------$(RESET)\n"
	@printf "$$ make $(GREEN)target$(RESET) [options]\n"
	@printf "$(GREEN)-------------- Available Targets ---------------------------$(RESET)\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-20s$(RESET) %s\n", $$1, $$2}'

build: ## Build the Playwright Docker image
	@printf "$(YELLOW)Building Playwright Docker image...$(RESET)\n"
	@docker build --no-cache -t playground-for-playwright-framework:latest .
	@printf "$(GREEN)Build complete!$(RESET)\n"

run-tests: ## Run Playwright tests
	@mkdir -p ${PWD}/reports
	@printf "$(YELLOW)Running Playwright tests...$(RESET)\n"
	@docker run --rm \
		-v ${PWD}/reports:/app/reports \
		playground-for-playwright-framework:latest npx playwright test
	@printf "$(GREEN)Test complete!$(RESET)\n"


.PHONY: help build run-tests
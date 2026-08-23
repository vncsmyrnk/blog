.PHONY: dev
dev:
	hugo server -D

.PHONY: build
build:
	hugo --minify

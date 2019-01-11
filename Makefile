# Top level Makefile.

# Default target.
TARGET := all
# Default docker image.
DOCKER_IMAGE := perusio/pandoc-relayr:1.0
# Docker run options and flags.
DOCKER_FLAGS := --rm --mount type=bind,src=$(CURDIR),dst=/source

# Add each directory as a target.reference-manual user-guide product-brief:
iot-protocols:
ifeq ($(USE_DOCKER),y)
	docker run $(DOCKER_FLAGS) $(DOCKER_IMAGE) \
		--directory=$@ $(TARGET) top_goal=$(MAKECMDGOALS)
else
	make --directory=$@ $(TARGET) top_goal=$(MAKECMDGOALS)
endif

.PHONY: iot-protocols

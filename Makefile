
.PHONY: all buildroot rvvm web
all: buildroot rvvm web
buildroot:
	@echo "==> Building Buildroot image..."
	@./build-image.sh
rvvm:
	@echo "==> Building RVVM..."
	@./build-rvvm.sh
web:
	@echo "==> Building web assets..."
	@./build-webdir.sh
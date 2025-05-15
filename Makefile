
.PHONY: all buildroot rvvm web
all: buildroot rvvm web
rebuild: clean-buildroot buildroot rvvm web
buildroot:
	@echo "==> Building Buildroot image..."
	@./build-image.sh
rvvm:
	@echo "==> Building RVVM..."
	@./build-rvvm.sh
web:
	@echo "==> Building web assets..."
	@./build-webdir.sh
clean-buildroot:
	@echo "==> Cleaning Buildroot image..."
	cd build/buildroot
	rm -rf target
	find . -name ".stamp_target_installed" -delete
	rm -f ./build/host-gcc-final-*/.stamp_host_installed
	popd
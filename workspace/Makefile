build:
	lxc launch ubuntu:22.04 workspace \
		-c security.nesting=true \
		-c security.privileged=true \
		--config user.user-data="$(cat cloud-init.yaml)"

clean:
	lxc stop workspace
	lxc delete workspace

sh:
	lxc exec workspace bash

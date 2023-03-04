build:
	lxc launch ubuntu:22.04 workspace \
		-c security.nesting=true \
		-c security.privileged=true \
		-c user.user-data="$$(cat cloud-init.yaml)"

mount:
	lxc config device add workspace ssh disk source=$$HOME/.ssh path=/root/.ssh

clean:
	lxc stop workspace
	lxc delete workspace

sh:
	lxc exec workspace bash

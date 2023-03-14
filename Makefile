# コンテナを起動する
launch:
	lxc network set lxdbr0 ipv4.address 192.168.123.1/24
	lxc launch ubuntu:22.04 workspace \
		-c security.nesting=true \
		-c security.privileged=true \
		-c user.user-data="$$(cat cloud-init.yaml)"
	lxc config device override workspace eth0 ipv4.address=192.168.123.2
	./check_status.sh
	lxc config device add workspace ssh disk source=$$HOME/.ssh path=/home/workspace-user/.ssh
	lxc file push .zshrc workspace/home/workspace-user/.zshrc
	lxc file push init/* workspace/tmp/

# コンテナを停止してから削除
clean:
	lxc stop workspace
	lxc delete workspace

# コンテナに接続する
sh:
	lxc exec workspace -- su - workspace-user
